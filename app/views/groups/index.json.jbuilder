json.array!(@groups) do |group|
  json.extract! group, :id, :name, :user_id
  json.url group_url(group, format: :json)
end
