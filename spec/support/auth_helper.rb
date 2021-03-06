module AuthHelper
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def valid_headers(user)
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end
end
