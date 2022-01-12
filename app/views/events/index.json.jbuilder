json.array! @events do |event|
    json.id event.id
    json.title event.title
    json.description event.description
    json.city event.city
    json.status event.status
    json.upvote event.upvote
    json.downvote event.downvote
    json.viewcount event.viewcount
end