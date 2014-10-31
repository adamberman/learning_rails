class SubsController < ApplicationController
  
  before_action :sub_editor_is_moderator, only: [:edit, :update, :destroy]
  
  def index
    @subs = Sub.all
    render :index
  end
  
  def new
    @sub = Sub.new
    render :new
  end
  
  def create
    @sub = Sub.new(sub_params.merge({ moderator_id: current_user.id }))
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end
  
  def show
    @sub = Sub.find(params[:id])
    @mod = @sub.moderator
    @posts = @sub.posts
    render :show
  end
  
  def edit
    render :edit
  end
  
  def update
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @sub.destroy
  end

  
  protected
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
  def sub_editor_is_moderator
    @sub = Sub.find(params[:id])
    if @sub.moderator != current_user
      redirect_to subs_url(@sub)
    end  
  end
end
