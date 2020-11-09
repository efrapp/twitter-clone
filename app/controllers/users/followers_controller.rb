class Users::FollowersController < ApplicationController
  include Searchable

  def index
    @followers = @user.followers.full_name_asc.page(params[:page])
  end
end
