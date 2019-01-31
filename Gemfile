source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'devise', '~> 4.5'

gem 'slim-rails', '~>3.2'

group :development, :test do
  # Byebug is a Ruby debugger
  gem 'byebug', '~> 9.1'

  # factory_bot_rails provides integration between factory_bot and rails
  gem 'factory_bot_rails', '~> 4.8'

  # Faker refactored
  gem 'ffaker', '~> 2.10'

  # Use Pry as your rails console
  gem 'pry-rails', '~> 0.3'

  # Reek is a tool that examines Ruby classes, modules and methods
  # and reports any code smells it finds
  gem 'reek', '~> 4.7'

  # rspec-rails is a testing framework for Rails 3+
  gem 'rspec-rails', '~> 3.7'

  # Automatic Ruby code style checking tool
  gem 'rubocop', '~> 0.51'
end

group :development do
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on
  # the database schema.
  gem 'annotate', '~> 2.7', '>= 2.7.4'

  # Provides a better error page for Rails and other Rack apps
  gem 'better_errors', '~> 2.4'

  # Listen gem listens to file modifications and notifies you about the changes
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Preloads your application so things like console, rake and tests run faster
  gem 'spring', '~> 2.0'

  # Makes spring watch files using the listen gem
  gem 'spring-watcher-listen', '~> 2.0.0'

  # A debugging tool for your Ruby on Rails applications
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Capybara is an integration testing tool for rack based web applications.
  # It simulates how a user would interact with a website
  gem 'capybara', '~> 2.13'

  # Easy installation and use of chromedriver, the Chromium project's
  # selenium webdriver adapter.
  gem 'chromedriver-helper', '~> 2.1'

  # Strategies for cleaning databases, used to ensure a clean state for testing
  gem 'database_cleaner', '~> 1.6'

  # Guard is a command line tool to handle events on file system modifications
  gem 'guard', '~> 2.14'

  # Guard::RSpec automatically run your specs (much like autotest)
  gem 'guard-rspec', '~> 4.7'

  # Extracting `assigns` and `assert_template` from ActionDispatch
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'

  # Collection cardinality matchers, extracted from rspec-expectations
  gem 'rspec-collection_matchers', '~> 1.1'

  # BDD for Ruby. RSpec runner and example groups
  gem 'rspec-core', '~> 3.7'

  # RSpec's 'test double' framework, with support for stubbing and mocking
  gem 'rspec-mocks', '~> 3.7'

  # WebDriver is a tool for writing automated tests of websites. It aims to
  # mimic the behaviour of a real user, and as such interacts with the HTML of
  # the application
  gem 'selenium-webdriver', '~> 3.1'

  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers', '~> 3.0'

  # Code coverage for Ruby 1.9+ with a powerful configuration library and
  # automatic merging of coverage across test suites
  gem 'simplecov', '~> 0.15'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
