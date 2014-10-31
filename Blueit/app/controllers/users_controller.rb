class UsersController < ApplicationController
  
  before_action :present_user_cannot_access_page, only: [:new, :create]
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    render :show
  end
  
  def update
  end
  
  def destroy
  end
  
  def index
  end
  
  protected
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
