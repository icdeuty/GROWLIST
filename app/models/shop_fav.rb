class ShopFav < ApplicationRecord
	belongs_to :user
	belongs_to :shop

	has_many :shop_favs, dependent: :destroy

	def favorited_by?(user)
		shop_favs.where(user_id: user.id).exists?
	end
end
