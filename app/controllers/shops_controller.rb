class ShopsController < ApplicationController

  def index
    @posts = Post.where(category_id: '3').order(created_at: :desc).includes(:user)
  end
end
