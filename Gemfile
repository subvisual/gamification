source "https://rubygems.org"

ruby "2.2.3"

gem "administrate"
gem "clearance"
gem "dotenv-rails"
gem "email_validator"
gem "foreman"
gem "jquery-rails"
gem "omniauth"
gem "omniauth-headquarters", github: "subvisual/omniauth-headquarters"
gem "omniauth-oauth2", "~> 1.3.1"
gem "pg"
gem "pry-rails"
gem "puma"
gem "rack-timeout"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "sass-rails"
gem "slack-rtmapi"
gem "slack-ruby", require: "slack"
gem "slim-rails"
gem "turbolinks"
gem "uglifier"
gem "whenever", :require => false

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
end

group :development, :test do
  gem "awesome_print"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.0"
  gem "rubocop", require: false
  gem "scss_lint", require: false
end

group :test do
  gem "database_cleaner"
  gem "faker"
  gem "shoulda-matchers"
end

group :production, :staging do
  gem "rails_12factor"
end
