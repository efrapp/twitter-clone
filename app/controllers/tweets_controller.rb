class TweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to user_path(current_user), notice: 'Tweet created successfully'
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end
