source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails',     github: 'rails/rails'
gem 'arel',      github: 'rails/arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'sass-rails',   github: 'rails/sass-rails'
gem 'eventmachine', github: 'ttilley/eventmachine', branch: 'as'
gem 'thin'

group :assets do
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara', '~> 2.0'
end

gem 'pry', group: [:development, :test]
