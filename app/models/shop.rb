class Shop < ApplicationRecord
	with_options presence:true do
		validates :shop_name
		validates :feature
		validates :postal_code
		validates :address_city
		validates :address_building
		validates :phone_number
		validates :point
	end

	belongs_to :user
	# attachment :img

	include JpPrefecture
	jp_prefecture :prefecture_code

	def prefecture_name
		JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
	end

	def prefecture_name=(prefecture_name)
		self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
	end
end
