class User < ActiveRecord::Base
  has_many :follower_connections
  has_many :followers, through: :follower_connections

  has_many :following_connections, :class_name => "FollowerConnection", :foreign_key => "follower_id"
  has_many :following, :through => :following_connections, :source => :user
  attr_accessible :follower_id, :user_id

  has_many :tweets

  has_many :favorite_tweets
  has_many :favorites, through: :favorite_tweets, source: :tweet

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :info
  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :user_name, length: { in: 3..20 }
  validates :info, length: { maximum: 140 }

  before_create :set_gravatar_url

  def following_tweets
    ids = following.map(&:id) << id
    Tweet.descending_order ids
  end

  def following?(user)
    following.include?(user)
  end

  def follow(user_id)
    user_to_follow = User.find_by_id(user_id)
    following << user_to_follow
  end

  def unfollow(user_id)
    following_connections.where(follower_id: id, user_id: user_id).first.destroy
  end

  def favorited?(tweet)
    favorites.include? tweet
  end

  def favorite_tweet(tweet_id)
    tweet = Tweet.find_by_id(tweet_id)
    favorites << tweet
  end

  def unfavorite(tweet_id)
    favorite_tweets.where(tweet_id: tweet_id, user_id: id).first.destroy
  end

  def publish_tweet(params)
    tweets.new(params)
    save
  end

  # Public: Find the amount of followers a user has, or the amount of users he
  # is following
  #
  # Examples
  #
  #   user.followers_count
  #   # => 4
  #
  #   user.following_count
  #   # => 2
  #
  #   user.tweets_count
  #   # => 3
  #
  # Returns an integer
  [:tweets, :followers, :following].each do |meth|
    define_method "#{meth}_count" do
      public_send(meth).count
    end
  end

  private
  def set_gravatar_url
    self.gravatar_url = GravatarUrlGenerator.create_url(email)
  end
end
