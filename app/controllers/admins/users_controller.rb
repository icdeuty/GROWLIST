class Admins::UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	  	@tweets = Tweet.page(params[:page]).per(4)
	  	@shops = Shop.all
	  	@blogs = Blog.all
	end
end