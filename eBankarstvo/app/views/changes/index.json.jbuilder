json.array!(@changes) do |change|
  json.extract! change, :id, :name, :description, :category_id, :priority_id, :user_id, :status, :confirmed, :comment
  json.url change_url(change, format: :json)
end
