class Api::V1::SessionsController < Api::V1::ApiBaseController
  def create
    @user = User.find_by_email(params[:user][:email])
    return failure if @user.blank?
    
    if @user.try(:valid_password?, params[:user][:password]) 
      token = @user.generate_api_token
      sign_in @user
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
    if token.present?
      token.destroy
      render :status => 200,
             :json => { :success => true,
                        :info => "Logged out",
                        :data => { :auth_token => token }
                      }
    else
      render :status => 401,
             :json => { :success => false,
                        :info => "Auth token is not valid",
                        :data => {} } and return
    end
  end
  
  protected
    def failure
      render :status => 401,
             :json => { :success => false,
                        :info => "Email or password not match",
                        :data => {} } and return
    end    
end 
