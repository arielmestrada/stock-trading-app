source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sprockets-rails"
gem 'pg'
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem 'sass-rails'
gem 'turbolinks'
gem 'devise'
gem 'bootstrap', '~> 5.2.0'
gem 'iex-ruby-client'
gem 'cancancan'
gem 'jquery-rails'
gem "font-awesome-sass"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'rspec-rails'
  gem 'database_rewinder'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
