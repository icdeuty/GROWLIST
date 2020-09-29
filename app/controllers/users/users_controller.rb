class Users::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:admins]
  before_action :ensure_user, only: [:edit, :update, :destroy]
  #before_action :configure_permitted_parameters, id: :devise_controller?
  def top
  	@user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@tweets = Tweet.page(params[:page]).per(4)
  	@shops = Shop.all
  	@blogs = Blog.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to users_user_path(current_user)
  end

  def users_tweets
  	@user = User.find(params[:id])
  	@tweets = Tweet.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  protected
  def user_params
	params.require(:user).permit(:name, :profile_img)
  end
  def tweet_params
	params.permit(:text, :user_id)
  end

  def shop_params
	params.require(:shop).permit(:postal_code, :prefecture_code, :address_city, :address_building)
  end

  def ensure_user
    @user = User.find(params[:id])
    redirect_to users_users_top_path unless @user == current_user
  end


  #def configure_permitted_parameters
 # 	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
 # 	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
end
