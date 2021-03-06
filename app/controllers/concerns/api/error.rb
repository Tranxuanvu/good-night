module Api
  module Error
    class RequestError < StandardError; end

    class AuthenticationError < StandardError; end

    class UnprocessableError < StandardError; end

    CUSTOM_MESSAGE = {
      forbidden: 'Invalid request.',
      not_found: 'Record not found.',
      unauthorized: 'Unauthorized.',
      internal_server_error: 'Something went wrong!',
      invalid_phone_number_format: 'Phone number is invalid.'
    }.freeze
  end
end
