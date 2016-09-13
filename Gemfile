ruby '2.3.1'

# Primary source
source 'https://rubygems.org'

# (List gems from other sources in blocks here as needed)

# Core gems
gem 'rails', '>= 5.0.0.beta4', '< 5.1'
gem 'pg', '>= 0.19.0.beta'
gem 'react_on_rails', '~> 6'
gem 'mini_racer'
gem 'execjs'
gem 'humanize'
gem 'friendly_id', github: 'norman/friendly_id', ref: 'aff05645'
gem 'storext', '~> 2.2'
gem 'haml', '~> 4.0.7'
gem 'haml-rails', '~> 0.9'
gem 'simple_form'
gem 'jbuilder', '~> 2.6.0'
gem 'draper', '>= 3.0.0.pre1'

group :assets do
  gem 'sass-rails'
  gem 'uglifier'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'listen'
end

group :test do
  gem 'rspec', require: true
  gem 'rspec-rails', '~> 3.5'
  gem 'poltergeist', '~> 1.10'
  gem 'database_cleaner', '~> 1.5'
  # gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'fabrication', '~> 2.15'
  gem 'site_prism', '~> 2.9'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'with_model'
end

group :development, :test do
  gem 'spinach-rails', '~> 0.2'
  gem 'byebug', platform: :mri
end

# Eurgh
platforms :mingw, :mswin do
  gem 'tzinfo-data'
  gem 'wdm'
end
