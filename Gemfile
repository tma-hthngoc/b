source 'https://rubygems.org'

gem 'rails', '3.2.11'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec'
  gem 'rspec-rails'
  #gem 'unicorn'
 gem 'debugger'
  #gem 'debugger' unless ENV["RM_INFO"]
end

gem 'simplecov', :require => false, :group => :test

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "ckeditor"

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'paperclip'
gem 'aws-sdk'
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
gem 'pdfkit'

gem 'rails_12factor'