class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Post.where(category_id: '2')
  end  
end
