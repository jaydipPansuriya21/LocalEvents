require 'rails_helper'

RSpec.describe EventVote, type: :model do
  context "#validation" do
    let(:event_vote) { build(:event_vote) }
    it 'nagative value can not valid for viewcount' do
        event_vote.viewcount = -1
        expect(event_vote).not_to be_valid
    end
    it 'nagative value can not valid for upvote' do
        event_vote.upvote = -1
        expect(event_vote).not_to be_valid
    end
        it 'nagative value can not valid for downvote' do
        event_vote.downvote = -1
        expect(event_vote).not_to be_valid
    end

    it 'non integer value can not valid for viewcount' do
        event_vote.viewcount = "asa10"
        expect(event_vote).not_to be_valid
    end
    it 'non integer value can not valid for upvote' do
        event_vote.upvote = "helo13"
        expect(event_vote).not_to be_valid
    end
    it 'non integer value can not valid for downvote' do
        event_vote.downvote = "1323ds"
        expect(event_vote).not_to be_valid
    end
  end 
end
