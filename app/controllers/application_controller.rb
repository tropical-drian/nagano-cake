class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  protected

  # 新規登録の時の保存機能
  # 会員情報編集時の保存機能
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :residence, :phone_number, :password]
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    end

  def
    after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
          root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
