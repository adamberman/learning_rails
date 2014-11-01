class PostsController < ApplicationController
  
  before_action :non_owner_cannot_edit_update_or_destroy_post, 
    only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end
  
  def create
    more_params = { author_id: current_user.id }
    @post = Post.new(post_params.merge(more_params))
    if @post.save
      redirect_to post_url(@post)
    else
      @subs = Sub.all
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @author = @post.author
    @subs = @post.subs
    render :show
  end
  
  def edit
    @subs = Sub.all
    render :edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @post.destroy
    redirect_to subs_url
  end
  
  protected
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
  
  def non_owner_cannot_edit_update_or_destroy_post
    @post = Post.find(params[:id])
    if current_user != @post.author
      flash[:errors] = ["Fuck Off"]
      redirect_to user_url(current_user)
    end
  end
end
