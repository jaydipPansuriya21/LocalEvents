class Event < ApplicationRecord
    has_one :event_vote
    STATUS_OPTIONS = %w(Pending Rejected InReview)
    validates :status, inclusion:  { in: STATUS_OPTIONS }  
    validates :title, presence: :true
end
