require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  let(:user1) { create(:user) }

  before do
    sign_in user1
    create_list(:relationship, 10, following: user1)
  end

  describe 'followers counter' do
    context 'with 10 followers' do
      it do
        visit user_path(user1)

        expect(page).to have_content('Followers: 10')
      end
    end

    context 'with 0 followers' do
      it do
        Relationship.destroy_all
        visit user_path(user1)

        expect(page).to have_content('Followers: 0')
      end
    end
  end
end
