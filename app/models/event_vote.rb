class EventVote < ApplicationRecord
    belongs_to :event
    METHODS = %i(viewcount viewcount= downvote downvote= upvote upvote=)
    validates :viewcount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :upvote, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :downvote, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end