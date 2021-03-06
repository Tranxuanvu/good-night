module Api
  class Authorize
    attr_reader :headers
    attr_accessor :user

    def initialize(headers = {})
      @headers = headers
      retrieve_user
    end

    def call
      @user
    end

    private

    def retrieve_user
      auth_token = decoded_auth_token

      @user = User.where(id: auth_token[:user_id]).first if auth_token.present?
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      headers['Authorization'].split(' ').last if headers['Authorization'].present?
    end
  end
end
