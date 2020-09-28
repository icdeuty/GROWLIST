class Tweet < ApplicationRecord
	belongs_to :user
	has_many :comments

	has_many :tweet_favs, dependent: :destroy

	def favorited_by?(user)
		tweet_favs.where(user_id: user.id).exists?
	end
end
