ENV['RAILS_ENV'] = 'test'
require './config/environment'
require 'minitest/spec'
require 'database_cleaner'
require 'capybara/poltergeist'
require 'rspec'

# DB stuff
DatabaseCleaner.strategy = :truncation

# Run settings
Spinach.config.save_and_open_page_on_failure = true
Capybara.javascript_driver = :poltergeist

# Hooks
Spinach.hooks.before_scenario do
  DatabaseCleaner.clean
end

Spinach.hooks.on_tag('javascript') do
  ::Capybara.current_driver = ::Capybara.javascript_driver
end
