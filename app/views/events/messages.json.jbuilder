message_text = "Event #{action_type} successfully"

if saved
    json.message message_text
else
    json.errors @event.errors
end


