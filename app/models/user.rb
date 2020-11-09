class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  has_many :follower_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followings, through: :following_relationships, source: :following

  scope :full_name_asc, -> { order(:full_name) }

  validates :username, presence: true

  def already_follow?(user:)
    user.follower_relationships.where(follower: self).present?
  end
end
