json.array!(@problems) do |problem|
  json.extract! problem, :id, :name, :description, :status
  json.url problem_url(problem, format: :json)
end
