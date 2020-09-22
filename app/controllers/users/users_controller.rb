class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :configure_permitted_parameters, id: :devise_controller?
  def top
  	@user = current_user
  end

  def show
  	@user = User.find(current_user.id)
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
  #def configure_permitted_parameters
 # 	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
 # 	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
end
