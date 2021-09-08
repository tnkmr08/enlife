class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(weet_params)
    if @tweet.save
      redirect_to root_path
    else 
      render :new
    end   
  end
  private

  def tweet_params
    params.require(:tweet).permit(:text, :category_id).marge(user_id: current_user.id)
  end


end
