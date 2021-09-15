class ShopsController < ApplicationController

  def index
    @shops = Post.where(category_id: '3')
  end
end
