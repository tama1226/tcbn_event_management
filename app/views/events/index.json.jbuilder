json.array!(@events) do |event|
  json.extract! event, :id, :name, :start_on
  json.start event.name
  json.start event.start_on
  json.url event_url(event, format: :html) 
end