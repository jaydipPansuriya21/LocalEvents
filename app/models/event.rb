class Event < ApplicationRecord
    has_one :event_vote, dependent: :destroy
    delegate *EventVote::METHODS, to: :event_vote

    STATUS_OPTIONS = %w(Pending Rejected InReview)
    validates :status, inclusion:  { in: STATUS_OPTIONS }  
    validates :title, presence: :true
    after_initialize do 
        self.build_event_vote if event_vote.nil?
    end
end
