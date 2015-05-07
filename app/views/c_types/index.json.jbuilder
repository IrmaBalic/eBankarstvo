json.array!(@c_types) do |c_type|
  json.extract! c_type, :id, :name
  json.url c_type_url(c_type, format: :json)
end
