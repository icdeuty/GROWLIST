class Users::ShopCommentsController < ApplicationController


	def index
		@tweet = Tweet.find(params[:tweet_id])
		@comment = Comment.new
		@comments = Comment.where(tweet_id: @tweet
	end

	def create
		@comment = Comment.create(text: params[:comment][:text],tweet_id: params[:tweet_id], user_id: current_user.id)
		redirect_to request.referer
	end

	def destroy
	end
end
