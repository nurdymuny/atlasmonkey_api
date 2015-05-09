class Api::V1::SessionsController < Api::V1::ApiBaseController
  def create
    @user = User.find_by_email(params[:user][:email])
    return failure if @user.blank?
    
    if @user.try(:valid_password?, params[:user][:password]) 
      token = @user.generate_api_token
      render  :status => 200,
              :json => { :success => true,
              :info => "Logged in",
              :user => @user,
              :data => { :auth_token => token }
                    }
    else
      failure
    end         
  end 

  def destroy
    token = UserToken.find_by_auth_token(request.headers['auth-token'])
    return failure if token.blank?
    token.destroy
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => { :auth_token => token }
                    }
  end
  
  protected
    def failure
      render :status => 401,
             :json => { :success => false,
                        :info => "Email and password not match",
                        :data => {} } and return
    end    
end 
