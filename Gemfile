ruby '2.3.1'

# Primary source
source 'https://rubygems.org'

# (List gems from other sources in blocks here as needed)

# Core gems
gem 'rails', '>= 5.0.0.beta4', '< 5.1'
gem 'pg', '>= 0.19.0.beta'
gem 'react-rails', '~> 1.5'

group :development do
  gem 'web-console', '~> 3.0'
  gem 'byebug', platform: :mri
  gem 'listen'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails', '~> 3.5'
  gem 'poltergeist', '~> 1.10'
  gem 'database_cleaner', '~> 1.5'
end

group :development, :test do
  gem 'spinach-rails', '~> 0.2'
  gem 'dotenv-rails'
end

# Eurgh
platforms :mingw, :mswin do
  gem 'tzinfo-data'
  gem 'wdm'
end
