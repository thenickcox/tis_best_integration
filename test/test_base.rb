require 'minitest/pride'
require 'minitest/unit'
require 'capybara'
require 'capybara/dsl'

Capybara.app_host = 'http://google.com'

Capybara.run_server =false
Capybara.default_wait_time = 15

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Driver::Selenium.new(app, :browser => :chrome)
end

MiniTest::Unit.autorun

class TestBase < MiniTest::Unit::TestCase

  def new_session(driver = :selenium)
    session = Capybara::Session.new(driver)	  
  end

end

class Capybara::Session
  
  def page_contains(expected_text)
    has_content?(expected_text)
  end

  def url_contains(expected_url)
    current_path.downcase.include?(expected_url.downcase)
  end

  def is_visible(element)
    find(element).visible?
  end
  
end
