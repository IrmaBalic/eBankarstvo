json.array!(@change_types) do |change_type|
  json.extract! change_type, :id
  json.url change_type_url(change_type, format: :json)
end
