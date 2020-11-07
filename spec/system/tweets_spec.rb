require 'rails_helper'

RSpec.describe "Tweets", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user    
  end

  describe 'tweet creation' do
    context 'when message field is filled' do
      it do
        visit user_path(user)
        click_on 'Create Tweet'

        within 'form' do
          fill_in 'Tweet', with: Faker::Lorem.paragraph
          click_on 'Create Tweet'
        end

        expect(page).to have_current_path(user_path(user))
        expect(page).to have_content('Tweet created successfully')
      end
    end

    context 'when message field is empty' do
      it do
        visit user_path(user)
        click_on 'Create Tweet'

        within 'form' do
          click_on 'Create Tweet'
        end

        expect(page).to have_content("Message can't be blank")
      end
    end

    context 'when message length is more than 289 characters' do
      it do
        visit user_path(user)
        click_on 'Create Tweet'

        within 'form' do
          fill_in 'Tweet', with: Faker::Lorem.paragraph_by_chars(number: 300)
          click_on 'Create Tweet'
        end

        expect(page).to have_content('280 characters is the maximum allowed')
      end
    end
  end
end
