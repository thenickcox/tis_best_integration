require_relative 'test_base'

class Search < TestBase
  def test_should_be_able_to_perform_free_text_search 
    s = new_session
    s.visit '/'
    s.fill_in "q", :with => 'Mountain West Ruby Conference'
    s.click_on 'Search'
    assert s.page_contains('MWRC')
  end

  def test_should_be_able_to_perform_image_search
    s = new_session(:selenium_chrome)
    s.visit '/'
    s.click_on 'Images'
    s.fill_in "q", :with => 'Mountain West Ruby Conference' 
    s.click_on 'Search Images'
    assert s.find('.rg_ul')
    assert s.url_contains('images')
  end
end
