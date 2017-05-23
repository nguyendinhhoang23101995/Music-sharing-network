source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'mysql2', '>= 0.3.18', '< 0.5'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Compass
gem 'sass-rails', '~> 5.0'
gem 'compass-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Font-awesome
gem "font-awesome-rails"

# Upload avatar
gem 'carrierwave'
gem 'mini_magick'
gem 'remotipart'

# Pagination
gem 'kaminari'

# Parse XML data
gem 'nokogiri'

# Authentication
gem 'sorcery', '0.9.0'

# Slim
gem 'slim'

# Memcached
gem 'dalli'

# i18n
gem 'rails-i18n'



group :development do
  gem "better_errors"
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'traceroute'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'guard-minitest',     '2.3.1'
end

# require: false so bcrypt is loaded only when has_secure_password is used.
# This is to avoid ActiveModel (and by extension the entire framework)
# being dependent on a binary library.
gem 'bcrypt', require: false

