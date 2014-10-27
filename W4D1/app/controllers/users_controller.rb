class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
  
  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
