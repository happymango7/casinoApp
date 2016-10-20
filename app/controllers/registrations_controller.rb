class RegistrationsController < Devise::RegistrationsController
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    super

    if resource.save
      @job_seeker = JobSeeker.new()
      @job_seeker.user_id = resource.id
      @job_seeker.save
    end
  end

  def edit
    if resource.job_seeker?
      render :edit_job_seeker
    elsif resource.employer?
      render :edit_employer
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role
    devise_parameter_sanitizer.for(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, job_seeker_attributes: [
        :first_name,
        :middle_initial,
        :last_name,
        :suffix,
        :residency,
        :address_line_1,
        :address_line_2,
        :city,
        :state,
        :postal_code,
        :primary_phone,
        :secondary_phone,
        :username,
        :hear_about_us,
        :confirm_tos_pp,
        :user_id,
        :prefix,
        :document_file_name,
        :document_content_type,
        :document_file_size,
        :document_updated_at
        ])
    end
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end


end
