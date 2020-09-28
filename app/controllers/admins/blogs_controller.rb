class Admins::BlogsController < ApplicationController

	def index
		@blogs = Blog.all.order(created_at: :desc)
	end
end
