class Users::BlogsController < ApplicationController
	def index
		@search = Blog.ransack(params[:q])
		@blogs = @search.result
	end

	def new
		@blog = Blog.new
	end

	def show
		@blog = Blog.find(params[:id])
		@user = @blog.user
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user.id
		if @blog.save
			redirect_to users_blogs_path(current_user)
		else
			render 'new'
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
	  	blog = Blog.find(params[:id])
	  	blog.update(blog_params)
	  	redirect_to users_blog_path(blog_params)
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy if blog.user_id == current_user.id
		redirect_to users_blogs_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :text, :img)
	end
	def user_params
		params.require(:user).permit(:name)
	end

end
