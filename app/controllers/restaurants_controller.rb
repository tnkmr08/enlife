class RestaurantsController < ApplicationController
  def index
    @posts = Post.where(category_id: '2').order(created_at: :desc).includes(:user)
  end  
end
