class SpotsController < ApplicationController

  def index
    @posts = Post.where(category_id: '4').order(created_at: :desc).includes(:user)
  end
end
