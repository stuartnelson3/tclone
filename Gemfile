source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0.rc1'
gem 'devise'
gem 'rspec-rails'
gem 'puma'
gem 'protected_attributes'
gem 'jquery-rails'

group :production do
  gem 'pg'
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
group :development do
  gem 'sqlite3'
  gem 'mailcatcher'
end

gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails', branch: 'master'
gem "therubyracer"
gem "less-rails"
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
