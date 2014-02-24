require_relative 'spec_helper'

describe 'Tis Best Site' do
  describe 'basic nav' do
    let(:page) { new_session(:poltergeist) }
    before do
      page.visit '/'
    end
    it 'Loads the homepage' do
      expect(page).to have_content('A meaningful gift that makes a difference')
    end
    it 'Loads the gift card buying page' do
      page.click_link 'Buy Gift Cards'
      expect(page).to have_content 'Category'
    end
  end
end

