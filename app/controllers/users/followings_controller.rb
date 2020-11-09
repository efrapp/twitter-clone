class Users::FollowingsController < ApplicationController
  include Searchable

  def index
    @followings = @user.followings.full_name_asc.page(params[:page])
  end
end
