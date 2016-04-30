json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :fb_id, :username, :email, :country, :status, :state
  json.url user_url(user, format: :json)
end
