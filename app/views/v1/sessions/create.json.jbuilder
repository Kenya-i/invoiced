json.data do
  json.user do
    json.call(
      @user, :email, :authentication_token
    )
  end
end


# json.data do
#   json.user @user, :email, :authentication_token
# end
