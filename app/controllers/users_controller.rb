class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @followers = current_user.followers
    @followings = current_user.followings
  end
end
