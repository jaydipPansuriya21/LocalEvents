json.user_id params[:user_id]
json.event_id params[:event_id]
vote_value = "no"
if @vote_info
    if @vote_info.vote_type
        vote_value = "up"
    else
        vote_value = "down"
    end
end
json.vote_type vote_value
