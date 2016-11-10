class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

alias_method :current_user, :current_usuario

  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) do |usuario_params|
              usuario_params.permit(:nombre, :apellido, :domicilio, :fecNac,
              :DNI, :email, :password, :password_confirmation)
        end
      end
    end
