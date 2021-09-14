class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @restaurants = Post.where(category_id: '2')
    @shops = Post.where(category_id: '3')
    @spots = Post.where(category_id: '4')
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

  private
  def post_params
    params.require(:post).permit(:text, :category_id, :place_name, :image).merge(user_id: current_user.id)
  end
end
