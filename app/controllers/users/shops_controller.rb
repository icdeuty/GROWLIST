class Users::ShopsController < ApplicationController
def index
		@shops = Shop.all
	end

	def new
		@shop = Shop.new

	end

	def create
		# @shop = Shop.new(shop_params)
		if @shop = current_user.shops.create(shop_params)
			redirect_to users_shops_path(current_user)
		else
			render 'new'
		end
		# @shop.user_id = current_user.id
		# if @shop.save
		# 	redirect_to users_shops_path(current_user)
		# else
		# 	render 'new'
		# end
	end

	def show
		# @shop = Shop.find(id: shop.id)
		@shop = Shop.find(params[:id])
	end

	def edit
		@shop = Shop.find(params[:id])
	end


	def update
	  	shop = Shop.find(params[:id])
	  	shop.update(shop_params)
	  	redirect_to users_shop_path(shop_params)
	end

	def destroy
		shop = Shop.find(params[:id])
		shop.destroy if shop.user_id == current_user.id
		redirect_to users_shops_path
	end


	private
	def shop_params
		params.require(:shop).permit(
			:shop_name,
			:feature,
			:postal_code,
			:prefecture_code,
			:address_city,
			:address_building,
			:phone_number,
			:point,
			:img_id
			)
	end

end

