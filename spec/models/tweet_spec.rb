require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { build(:tweet) }

  describe 'validations' do
    context 'when message is present' do
      it do
        tweet.save
        tweet.reload

        expect(tweet).to be_valid
      end    
      
      it 'is expected to be less than 280 characters' do
        tweet.save
        tweet.reload

        expect(tweet.message.length).to be < 280
      end
    end

    context 'when message is empty' do
      it do
        tweet.message = nil
        tweet.save

        expect(tweet).to be_invalid
        expect(tweet.errors[:message]).to include("can't be blank")
      end
    end

    context 'when message length is more than 280 characters' do
      it do
        tweet.message = Faker::Lorem.paragraph_by_chars(number: 300)
        tweet.save

        expect(tweet).to be_invalid
        expect(tweet.errors[:message]).to include('280 characters is the maximum allowed')
      end
    end
  end
end
