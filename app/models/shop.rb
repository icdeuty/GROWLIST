class Shop < ApplicationRecord
	with_options presence:true do
		validates :shop_name
		validates :feature
		validates :postal_code
		validates :address
		validates :phone_number
		validates :point
	end
end
