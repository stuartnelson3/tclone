class User < ActiveRecord::Base
  has_many :follower_connections
  has_many :followers, through: :follower_connections

  has_many :following_connections, :class_name => "FollowerConnection", :foreign_key => "follower_id"
  has_many :following, :through => :following_connections, :source => :user
  attr_accessible :follower_id, :user_id

  has_many :tweets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me
  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :user_name, length: { in: 3..20 }

  before_create :set_gravatar_url

  def following_tweets
    following_ids = following.map(&:id)
    Tweet.where(user_id: following_ids).order("created_at DESC")
  end

  def publish_tweet(params)
    tweets.new(params)
    save
  end

  private
  def set_gravatar_url
    self.gravatar_url = GravatarUrlGenerator.create_url(email)
  end
end
