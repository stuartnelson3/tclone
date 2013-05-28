class UserQuery
  attr_reader :user_name
  def initialize(user_name)
    @user_name = user_name
  end

  def search
    User.where("user_name LIKE ?", "%#{user_name}%")
  end
end
