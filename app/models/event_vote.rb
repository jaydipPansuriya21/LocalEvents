class EventVote < ApplicationRecord
    belongs_to :event
    METHODS = %i(viewcount viewcount= downvote downvote= upvote upvote=)
    validates :viewcount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :upvote, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :downvote, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    after_initialize :default_value
    def default_value
        if self.new_record?
            self.viewcount = 0 
            self.upvote = 0
            self.downvote = 0
        end
    end
end
