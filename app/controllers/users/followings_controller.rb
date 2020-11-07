class Users::FollowingsController < ApplicationController
  def index
    @followings = current_user.followings.full_name_asc
  end
end
