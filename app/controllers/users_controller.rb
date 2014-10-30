class UsersController < ApplicationController
	
	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:session_token] = @user.reset_session_token!
			redirect_to user_url(@user)
		else
			render :new
		end
	end

	def index
		@users = User.all
		render :index
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end