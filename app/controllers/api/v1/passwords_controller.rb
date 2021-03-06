class Api::V1::PasswordsController < Devise::PasswordsController
   skip_before_filter :verify_authenticity_token
   respond_to :json

  def create
    @user  = User.send_reset_password_instructions(params[:user])
    if successfully_sent?(@user)
      render  :status => 200,
              :json => { :success => true, :info => "Password instruction send on your email" }
    else
      render  :status => 400,
              :json => { :success => false, :info => @user.errors.full_messages.join("<br/>") }
    end
  end
end
