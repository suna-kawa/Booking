class ApplicationController < ActionController::Base
  # deviseコントローラが呼ばれたら、下記メソッドを実行する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # sign_up, アカウント編集時にUserモデルからname属性を取得してのデータ操作を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
