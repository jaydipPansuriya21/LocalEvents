json.array! @events do |event|
    json.id event.id
    json.title event.title
    json.description event.description
    json.city event.city
    json.status event.status
    json.upvote event.event_vote.upvote
    json.downvote event.event_vote.downvote
    json.viewcount event.event_vote.viewcount
end