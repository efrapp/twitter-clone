require 'rails_helper'

RSpec.describe "ListFollowigUsers", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'follow 19 users' do
    let!(:followings) { create_list(:relationship, 19, follower: user) }

    before :each do
      visit user_path(user)

      within '.followings-count' do
        # Locator Integer:20 for selector :link must be an instance of String or Symbol.
        # This will raise an error in a future version of Capybara.
        click_link followings.size.to_s
      end
    end

    it 'is expected to have 10 users in the first page' do
      expect(page).to have_xpath('//table/tbody/tr', count: 10)
    end

    it 'is expected to have 9 users in the second page' do
      click_on 'Next'

      expect(page).to have_xpath('//table/tbody/tr', count: 9)
    end

    it 'is expected to have pagination controls' do
      expect(page).to have_content('Last »')
    end

    it 'is expected to have users in alphabetical order' do
      first_username = find(:xpath, '//table/tbody/tr[1]/td[1]').text
      second_username = find(:xpath, '//table/tbody/tr[2]/td[1]').text

      expect(first_username).to be < second_username
    end
  end
end
