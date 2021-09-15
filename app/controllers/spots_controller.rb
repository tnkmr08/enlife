class SpotsController < ApplicationController

  def index
    @spots = Post.where(category_id: '4')
  end
end
