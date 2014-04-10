json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :phone, :password_digest, :remember_token, :string, :admin
  json.url user_url(user, format: :json)
end
