# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  layout 'backend'
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new
    redirect_to admin_root_path
  end

  def create
    redirect_to admin_root_path
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    redirect_to admin_root_path
  end

  def cancel
    redirect_to admin_root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
