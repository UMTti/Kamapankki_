json.array!(@stuffs) do |stuff|
  json.extract! stuff, :id, :name, :user_id, :borrowed
  json.url stuff_url(stuff, format: :json)
end
