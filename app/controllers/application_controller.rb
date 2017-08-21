class ApplicationController < ActionController::Base
	before_action :detect_browser

	before_action :authenticate_user!
  	protect_from_forgery with: :exception

	protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end

	private

	def detect_browser
	  case request.user_agent
	    when /iPad/i
	      request.variant = :tablet
	    when /iPhone/i
	      request.variant = :phone
	    when /Android/i && /mobile/i
	      request.variant = :phone
	    when /Android/i
	      request.variant = :tablet
	    when /Windows Phone/i
	      request.variant = :phone
	    else
	      request.variant = :desktop
	   end
	end	
end
