class Users::BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			redirect_to users_blogs_path(current_user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :text, :img)
	end
end
