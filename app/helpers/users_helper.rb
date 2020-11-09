module UsersHelper
  def follow_user(user:)
    button_to 'Follow', relationships_path(follow: user) unless current_user.already_follow?(user: user)
  end
end
