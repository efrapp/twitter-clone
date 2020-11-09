class RelationshipsController < ApplicationController
  def create
    user = User.find_by(id: params[:follow])
    new_follower_relationship = Relationship.new(follower: current_user, following: user)

    if new_follower_relationship.save
      redirect_to user, notice: "You are now following to #{user.full_name}"
    else
      redirect_to users_followers_index_path, notice: new_follower_relationship.errors.messages.to_sentences
    end
  end
end
