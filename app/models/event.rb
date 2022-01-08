class Event < ApplicationRecord
    STATUS_OPTIONS = %w(Pending Rejected InReview)
    validates :status, inclusion:  { in: STATUS_OPTIONS }  
    validates :title, presence: :true
end
