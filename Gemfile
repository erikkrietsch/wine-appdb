source 'https://rubygems.org'

ruby '2.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use postgresql as the database for Active Record
gem 'pg'
# Use mysql for the bugzilla db
gem 'mysql'

gem 'haml-rails'
gem 'cucumber'
gem 'devise'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use Figaro to help with configuring via open source methods.
gem 'figaro'

# Redcarpet held my hand once on the bus to school.
gem 'redcarpet'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-ui-themes'
gem 'font-awesome-rails'
gem 'hallo-rails', github: 'ErikTRSI/hallo-rails'

gem 'less-rails'
gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

#use the Facebook React library
#gem 'react-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Paperclip to handle screenshot uploads
gem 'paperclip'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails', require: false
  gem 'pry'
  # For populating data elements as needed
  gem 'seed-fu', github: 'mbleigh/seed-fu'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'ruby_gntp'
  gem 'childprocess', '0.3.6'
end

group :test do
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'cucumber-rails', require: false
  gem 'launchy' 
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'rails_12factor'  
end

group :production, :development, :test do
    # AWS for storing uploads, should be temporary, for heroku/local dev.
  gem 'aws-sdk'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'


# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
