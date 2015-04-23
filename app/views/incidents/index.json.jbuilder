json.array!(@incidents) do |incident|
  json.extract! incident, :id, :name, :description, :category_id, :priority_id, :status
  json.url incident_url(incident, format: :json)
end
