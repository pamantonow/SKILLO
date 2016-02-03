json.(@current_user) 
  json.extract! @current_user, :longitude, :latitude, :id
  json.url user_url(current_user, format: :json)
