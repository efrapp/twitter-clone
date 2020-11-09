class Users::FollowingsController < ApplicationController
  before_action :set_user

  def index
    @followings = @user.followings.full_name_asc.page(params[:page])
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
