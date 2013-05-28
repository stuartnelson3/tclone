class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :text, presence: true
  validates :text, length: { maximum: 140 }
  attr_accessible :user_id, :text

  scope :descending_order, ->(ids) { where(user_id: ids).order("created_at DESC") }

  before_create :parse_for_mentions

  def owner_name
    user.user_name
  end

  def owner_image
    user.gravatar_url
  end

  def parse_for_mentions
    self.text = TweetParser.new(self).parse
  end
end
