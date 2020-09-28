class Users::RelationshipsController < ApplicationController
 before_action :set_user, except:[:index]

	def index
		@users = User.all
	end

	def create
		following = current_user.follow(@user)
		if following.save
			flash[:success] = 'ユーザをフォローしました'
			redirect_to request.referer
		else
			flash.now[:alert] = 'ユーザのフォローに失敗しました'
			redirect_to request.referer
		end
	end

	def destroy
		following = current_user.unfollow(@user)
		if following.destroy
			flash[:success] = 'ユーザのフォローを解除しました'
			redirect_to request.referer
		else
			flash.now[:alert] = 'ユーザのフォロー解除に失敗しました'
			redirect_to request.referer
		end
	end

	private
	def set_user
		@user = User.find(params[:relationship][:follow_id])
	end
end