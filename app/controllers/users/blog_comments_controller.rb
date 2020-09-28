class Users::BlogCommentsController < ApplicationController

	def index
		@blog = Blog.find(params[:blog_id])
		@blog_comment = BlogComment.new
		@blog_comments = BlogComment.where(blog_id: @blog)
	end

	def create
		@blogcomment = BlogComment.create(text: params[:blog_comment][:text],blog_id: params[:blog_id], user_id: current_user.id)
		redirect_to request.referer
	end

	def destroy
	end
	

	private
	def blog_params
		params.permit(:title, :text, :user_id, :blog_id, :img)
	end
end
