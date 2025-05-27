class Users::RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to after_sign_in_path_for(current_user) if user_signed_in?
    super
  end

  def create
    redirect_to after_sign_in_path_for(current_user) and return if user_signed_in?

    # Handle family assignment/creation
    if params[:family_token].present?
      family = Family.find_by(token: params[:family_token])
      unless family
        flash[:alert] = "Invalid family token"
        redirect_to new_user_registration_path and return
      end
    else
      family_name = params[:user][:family_name]

      # Check if family exists
      if Family.exists?(name: family_name)
        flash[:alert] = "A family with that name already exists"
        redirect_to new_user_registration_path and return
      end

      # Create the family
      family = Family.create!(name: family_name)
    end

    # Now create the user with the family
    build_resource(sign_up_params)
    resource.family = family

    if resource.save
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      # If user creation fails and we created a new family, delete it
      family.destroy if params[:family_token].blank?
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :family_token, :family_name ])
  end
end
