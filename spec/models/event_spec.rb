require 'rails_helper'

RSpec.describe Event, type: :model do
    context "validations" do
        let!(:event) { build(:event) }
        it 'can not vallid without title' do
            event.title = ""
            expect(event).not_to be_valid  
            # puts event.inspect
        end
        it 'status can not be set other then [Pending Rejected InReview]' do
            event.status = "hold"
            expect(event).not_to be_valid  
            # puts event.inspect
        end
        it 'status name is case sensitive' do
            event.status = "pending"
            expect(event).not_to be_valid 
            # puts event.inspect
        end
        it 'should create article successfully' do
            expect{ event.save }.to change { Event.count }.by(1)
            # puts event.inspect
        end
    end
    
end
