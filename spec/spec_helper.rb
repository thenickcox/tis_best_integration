require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'capybara/poltergeist'

Capybara.app_host = 'http://tisbest.org'

Capybara.run_server = false
Capybara.default_wait_time = 15

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Driver::Selenium.new(app, browser: :chrome)
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 45)
end

def new_session(driver = :selenium)
  Capybara::Session.new(driver)
end

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
