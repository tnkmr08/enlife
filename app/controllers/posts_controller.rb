class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @restaurants = Post.where(category_id: '2').order(created_at: :desc).limit(5).includes(:user)
    @shops = Post.where(category_id: '3').order(created_at: :desc).limit(5).includes(:user)
    @spots = Post.where(category_id: '4').order(created_at: :desc).limit(5).includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc).includes(:user)
    respond_to do |format|
      format.html
      format.js
    end  
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_path(@post.user.id)
    else
      render :edit
    end    
  end

  def destroy
    @post.destroy
    redirect_to user_path(@post.user.id)
  end

  private
  def post_params
    params.require(:post).permit(:text, :category_id, :place_name, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end  
end
