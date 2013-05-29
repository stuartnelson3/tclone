FactoryGirl.define do
  factory :user do
    user_name 'test_user'
    email 'test_user@example.com'
    password 'example_password'
  end

  factory :tweet do
    user_id '1'
    text 'here is an example tweet'
  end
end
