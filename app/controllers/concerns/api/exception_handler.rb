module Api
  module ExceptionHandler
    extend ActiveSupport::Concern
    include Error
    include Response

    CUSTOM_MESSAGE = {
      forbidden: 'Invalid request.',
      not_found: 'Record not found.',
      unauthorized: 'Unauthorized.',
      internal_server_error: 'Something went wrong!'
    }.freeze

    included do
      rescue_from StandardError, with: :handle_internal_server_error
      rescue_from AuthenticationError, with: :handle_unauthorized
      rescue_from RequestError, with: :handle_forbidden
      rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
      rescue_from ActionController::ParameterMissing, with: :handle_strong_parameters
    end

    private

    %i[internal_server_error unauthorized forbidden not_found unprocessable_entity].each do |status|
      define_method("handle_#{status}") do |error|
        Rails.logger.error(error.message)
        Rails.logger.error(error.backtrace.join("\r\n"))

        render_json(
          success: false,
          message: CUSTOM_MESSAGE[status] || error.message
        )
      end
    end
  end
end
