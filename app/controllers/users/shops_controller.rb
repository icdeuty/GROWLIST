class Users::ShopsController < ApplicationController
def index
		@shops = Shop.all
	end

	def new
		@shop = Shop.new
	end

	def show
		@shop = Shop.find(params[:id])
	end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
			redirect_to users_shops_path(current_user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def shop_params
		params.require(:shop).permit(
			:shop_name,
			:feature,
			:postal_code,
			:address,
			:phone_number,
			:point,
			:img
			)
	end
end

