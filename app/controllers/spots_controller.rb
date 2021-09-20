class SpotsController < ApplicationController

  def index
    @posts = Post.where(category_id: '4')
  end
end
