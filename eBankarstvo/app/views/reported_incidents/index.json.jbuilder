json.array!(@reported_incidents) do |reported_incident|
  json.extract! reported_incident, :id, :name, :description, :category_id
  json.url reported_incident_url(reported_incident, format: :json)
end
