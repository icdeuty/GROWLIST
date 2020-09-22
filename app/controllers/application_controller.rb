class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when User
			users_users_top_path
		when Admin
			admins_users_path
		end
	end

	def after_sign_up_path_for(resource)
		users_users_top_path
	end

	def after_sign_out_path_for(resource)
		if resource ==:admin
			new_admin_session_path
		else
			root_path
		end
	end

	protected

	def configure_permitted_parameters
		added_attrs = [:name, :email, :profile, :password, :password_confirmation]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
end
