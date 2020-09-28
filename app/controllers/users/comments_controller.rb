class Users::CommentsController < ApplicationController
	def index
		@tweet = Tweet.find(params[:tweet_id])
		@comment = Comment.new
		@comments = Comment.where(tweet_id: @tweet)
	end

	def create
		@comment = Comment.create(text: params[:comment][:text],tweet_id: params[:tweet_id], user_id: current_user.id)
		redirect_to request.referer
	end

	def show
		#@user = User.find(params[:id])
		@tweet = Tweet.find(params[:tweet_id])
		@comment = Comment.new
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		comment = Comment.find(params[:id])
		if comment.user_id == current_user.id
			comment.update(comment_params)
			redirect_to users_tweet_comment_path(current_user)
		else
			render 'edit'
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy if comment.user_id == current_user.id
		redirect_to request.referer
	end

	private
	# def comment_params
	# 	params.require(:comment).permit(:text, :tweet_id, :comment)
	# end

	def tweet_params
		params.permit(:text, :user_id, :tweet_id)
	end

end
