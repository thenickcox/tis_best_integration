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
      within '#cardDropDownList' do
        page.select('Christmas 1', from: 'Category')
      end
      page.find('#ctl00_ContentPlaceHolderMain_CardImages1_Image1').click
      page.find('#ctl00_ContentPlaceHolderMain_MailButton').click
      within('#ctl00_ContentPlaceHolderMain_CreateCardStep3page') do
        page.select('Me', from: 'Ship To')
        page.fill_in("Card is 'From'", with: 'Chad Edwards')
        page.fill_in('Personal Message', with: 'I am the best.')
      end
      page.find('#ctl00_ContentPlaceHolderMain_Mail1_btnPreview').click
      within('#ctl00_ContentPlaceHolderMain_Preview1_pnlMail') do
        expect(page).to have_content('We are sending this card to you. You will provide your address during checkout.')
      end
    end
  end
end

