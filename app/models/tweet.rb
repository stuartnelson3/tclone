class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :text, presence: true
  validates :text, length: { maximum: 140 }
  attr_accessible :user_id, :text

  def owner_name
    user.user_name
  end
  def owner_image
    user.gravatar_url
  end
end
