class CommentsController < ApplicationController
	before_action :must_be_logged_in_to_post, only: :create
	def new
		@comment = Comment.new(post_id: params[:post_id])
		render :new
	end

	def create
		more_params = { author_id: current_user.id }
		@comment = Comment.new(comment_params.merge(more_params))
		if @comment.save
			redirect_to post_url(@comment.post)
		else
			flash.now[:errors] = @comment.errors.full_messages
			render :new
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end

	def must_be_logged_in_to_post
		unless logged_in?
			redirect_to new_session_url
		end
	end
end
