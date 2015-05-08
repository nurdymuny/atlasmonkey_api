class Api::V1::RegistrationsController < Api::V1::ApiBaseController
  def create
    user = User.new(user_params)
    #user.skip_confirmation!
    if user.save
      token = user.generate_api_token
      render :status => 200,
        :json => { :success => true,
          :info => "Registered",
          :user => user,
          :data => {:auth_token =>token  } }                             
    else
      render :status => 422,
             :json => { :success => false,
                        :errors => user.errors.full_messages
                       }
    end
  end

   def update
    user = UserToken.find_by_auth_token(request.headers['auth-token']).user
    #user.skip_confirmation!
    if user.update_attributes(user_params)
      token = user.generate_api_token
      render :status => 200,
        :json => { :success => true,
          :info => "updated",
          :user => user,
          :data => { :auth_token =>token  } }                             
    else
      render :status => 422,
             :json => { :success => false,
                        :errors => user.errors.full_messages
                       }
    end
  end 

  private

  def user_params
    params.require(:user).permit(:email,:password)
  end 


end	