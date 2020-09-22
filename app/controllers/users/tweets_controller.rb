class Users::TweetsController < ApplicationController
	def index
		@user = current_user
		@tweets = Tweet.page(params[:page])
		#@search = Tweet.search(params[:q])
		#@tweets = @search.result.includes(:user).order("created_at DESC").page(params[:page]).per(20)
	end

	def search
	  @tweets = Tweet.search(params[:q])
	  @tweets = @tweets.page(params[:page])
	  render "index"
	end

	def new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if Tweet.create(text: tweet_params[:text], user_id: current_user.id)
			redirect_to users_tweets_path(current_user)
		else
			render 'create'
		end
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def update
		tweet = Tweet.find(params[:id])
		if tweet.user_id == current_user.id
			tweet.update(tweet_params)
			redirect_to users_tweets_path(current_user)
		else
			render 'edit'
		end
	end

	def show
		@user = current_user.id
		@tweets = Tweet.where(user_id: @user)
	end

	def show_tweets
		@user = current_user
		@tweets = Tweet.where(user_id: @user)
		@tweets = Tweet.page(params[:page])
	end

	def destroy
		tweet = Tweet.find(params[:id])
		tweet.destroy if tweet.user_id == current_user.id
		redirect_to users_tweets_path(current_user)
	end

	private
	def tweet_params
		params.permit(:text, :user_id)
	end

end
