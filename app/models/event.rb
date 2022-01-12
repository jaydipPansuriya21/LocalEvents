class Event < ApplicationRecord
    has_one :event_vote, dependent: :destroy, autosave: true
    delegate *EventVote::METHODS, to: :event_vote

    STATUS_OPTIONS = %w(Pending Rejected InReview)
    validates :status, inclusion:  { in: STATUS_OPTIONS }  
    validates :title, presence: :true
    after_initialize do 
        self.build_event_vote if event_vote.nil?
    end

    def self.create_event(attributes)
        event = Event.new(attributes)
        event.status = "Pending"
        event
    end

    def get_event_analytics
        self.event_vote
    end

    def increment_view
        self.viewcount += 1 
    end

    def increment_votes(data)
        self.upvote += get_vote_value_from_string(data[:upvote])
        self.downvote += get_vote_value_from_string(data[:downvote])
    end

    def decrement_votes(data)
        self.upvote -= get_vote_value_from_string(data[:upvote])
        self.downvote -= get_vote_value_from_string(data[:downvote])
    end

    def get_vote_value_from_string(value)
        value = value.to_i
        value = (value.negative?)? 0 : value
        value
    end
end