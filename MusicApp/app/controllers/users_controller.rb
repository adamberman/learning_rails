class UsersController < ApplicationController
	
	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in_user!(@user)
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