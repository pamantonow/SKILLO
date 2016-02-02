json.array!(@users) do |user|
  json.extract! :city
  json.url user_url(user, format: :json)
end
