source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Use Ruby 2.4.0
ruby '2.4.0'

#Cron jobs
gem 'whenever', :require => false
# Use rails-i18n for internationalization
gem 'rails-i18n', '~> 5.0.0'
# Use ionicons
gem 'ionicons-rails', '~> 2.0'
# Use font-awesome
gem 'font-awesome-rails', '~> 4.7'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Use jQuery
gem 'jquery-rails', '~> 4.3'
# Use Postgres as the database for Active Record
gem 'pg', '~> 0.18.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use bootstrap-sass
gem 'bootstrap-sass', '~> 3.3.6'
# Use bootstram-modals
gem 'bootstrap-modal-rails', '~> 2.2', '>= 2.2.5'
# Use paperclip to upload photos
gem 'paperclip', '~> 4.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-datatables-rails', '~> 3.4.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '~> 1.0'

# Use coccon for nested forms 
gem 'cocoon'
gem 'select2-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rails_real_favicon'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'rspec-rails', group: %i[development test]
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
