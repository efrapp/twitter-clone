class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user

  def show
    @followers = @user.followers
    @followings = @user.followings
  end

  def index
    @users = User.all.page(params[:page])
    @user = current_user
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
