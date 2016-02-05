json.array!(@users) do |user|
  json.extract! user, :city, :longitude, :latitude, :id, :avatar
  json.url user_url(user, format: :json)
end
