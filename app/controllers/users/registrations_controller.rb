class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_token])
  end

  def build_resource(hash = {})
    super
    if params[:family_token].present?
      family = Family.find_by(token: params[:family_token])
      resource.family = family if family
    else
      resource.build_family(name: "New Family")
    end
  end
end 