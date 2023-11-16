source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'a9n'
gem 'bootsnap', require: false
gem 'bootstrap'
gem "bunny", ">= 2.19.0"
gem 'devise'
gem 'google-api-client', require: 'google/apis/calendar_v3'
gem 'hotwire-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'kaminari'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.0.8'
gem 'redis', '< 6.0'
gem 'sassc-rails'
gem "sidekiq", "~> 7.1"
gem "sidekiq-cron", "~> 1.11"
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.6.6'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '>= 6.0.1'
  gem 'rubocop', require: false
  gem 'rubocop-gitlab-security'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers', '~> 5.3'
end

group :development do
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 2.0'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
