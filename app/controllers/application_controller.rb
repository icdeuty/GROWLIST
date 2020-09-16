class ApplicationController < ActionController::Base

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
end
