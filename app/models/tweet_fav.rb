class TweetFav < ApplicationRecord
	belongs_to :user
	belongs_to :tweet


	def favorited_by?(user)
		tweet_favs.where(user_id: user.id).exists?
	end
end
