class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #新規登録時にパラメーターを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end
  #ログイン後に遷移するページ指定
  def after_sign_in_path_for(resource)
    events_path
  end
end
