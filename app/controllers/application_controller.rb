class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :confirm_authorization, unless: :devise_controller?

  def confirm_authorization
    # logger.debug params
    unless ["tops"].include?(controller_name)
      unless teacher_signed_in?
        redirect_to root_path
      else
        unless current_teacher.is_authenticated
          unless params[:id].blank?
            unless controller_name == "teachers" && action_name == "show" && params[:id] == current_teacher.id.to_s
              redirect_to root_path
            end
          end
        end
      end
    end
  end

  def after_sign_in_path_for(resource)
    students_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :school_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana, :school_id])
  end
end
