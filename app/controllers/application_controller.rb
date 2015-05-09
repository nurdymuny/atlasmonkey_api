class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #load_and_authorize_resource
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.is_admin
      redirect_to api_v1_venues_path, :alert => "successfuly sign_in"
    else
      redirect_to home_index_path, :alert => exception.message
    end
  end


  def after_sign_in_path_for(resource)
    if current_user.is_admin
      api_v1_venues_path
    else
      home_index_path
    end
  end


  def current_ability
    if current_user.present?
      current_user = current_user
    else
      current_user = UserToken.find_by_auth_token(request.headers['auth-token']).user
    end
    @current_ability ||= Ability.new(current_user)
  end
end
