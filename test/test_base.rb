require 'test/unit'
require 'capybara'

Capybara.app_host = 'http://google.com'
Capybara.run_server =false

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Driver::Selenium.new(app, :browser => :chrome)
end

class TestBase < Test::Unit::TestCase

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
  
  def login
    click_link "Sign in"
    fill_in "Email", :with => 'your_account@gmail.com'
    fill_in "Passwd", :with => 'password'
    click_link "signIn" 
    assert page_contains('Your Name')
  end

end
