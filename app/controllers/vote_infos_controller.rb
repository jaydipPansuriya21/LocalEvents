class VoteInfosController < ApplicationController
    def user_vote_type
        @vote_info = VoteInfo.find_by(user_event_params)
        if true 
        end
    end

    private

    def user_event_params
        params.permit(:user_id, :event_id)
    end
end