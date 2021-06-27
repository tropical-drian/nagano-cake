# frozen_string_literal: true

<<<<<<< HEAD
<<<<<<<< HEAD:app/controllers/admins/registrations_controller.rb
class Admins::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
========
class Customers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
>>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8:app/controllers/customers/registrations_controller.rb
=======
class Admins::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

<<<<<<< HEAD
  protected

  # If you have extra params to permit, append them to the sanitizer.

  def configure_sign_up_params
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_account_update_params
    added_attrs = [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :residence, :phone_number, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # パスワードなしで登録情報を更新する機能
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

=======
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
<<<<<<< HEAD
   def after_sign_up_path_for(resource)
     customers_path
   end
=======
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
