class Users::TweetFavsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_tweet

def create
	@tweet = Tweet.find(params[:tweet_id])
	tweet_fav = current_user.tweet_favs.new(tweet_id: @tweet.id)
	tweet_fav.save
	redirect_to request.referer
end

def destroy
	@tweet = Tweet.find(params[:tweet_id])
	tweet_fav = current_user.tweet_favs.find_by(tweet_id: @tweet.id)
	tweet_fav.destroy
	redirect_to request.referer
end

private
def set_tweet
	@tweet = Tweet.find(params[:tweet_id])
end

end
