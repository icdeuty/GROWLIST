class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		users_root_path
	end

	def after_log_in_path_for(resource)
		users_root_path
	end

	def after_log_out_path_for(resource)
		root_path
	end
end
