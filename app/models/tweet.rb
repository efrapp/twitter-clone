class Tweet < ApplicationRecord
  belongs_to :user

  validates :message, presence: true
  validates :message, length: { maximum: 280,
                                too_long: '%<count> characters is the maximum allowed' }
end
