require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe 'validations' do
    let(:follow) { build(:relationship, follower: user1, following: user2) }

    context 'user1 and user2 are valid' do
      it {
        expect { follow.save }.to change(Relationship, :count).by(1)
      }

      it 'user1 follows user2' do
        follow.save
        follow.reload

        expect(user2.followers.first).to eq(user1)
        expect(user2.followings.first).to eq(nil)
        expect(user1.followings.first).to eq(user2)
      end
    end

    context 'follow non-existing user' do
      it do
        follow.following = nil
        follow.save

        expect(follow).to be_invalid
        expect(follow.errors[:following]).to include('must exist')
      end
    end
  end
end
