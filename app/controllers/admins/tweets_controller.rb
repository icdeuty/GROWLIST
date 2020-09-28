class Admins::TweetsController < ApplicationController

	def index
		@tweets = Tweet.all.order(created_at: :desc)
		#@user = User.find(params[:id])
	end
end
