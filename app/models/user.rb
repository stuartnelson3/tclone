class User < ActiveRecord::Base
  has_many :follower_connections
  has_many :followers, through: :follower_connections
  has_many :tweets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me
  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :user_name, length: { in: 3..20 }

  before_create :set_gravatar_url

  def following_tweets
    join(:following => :tweets).select(:tweets)
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
