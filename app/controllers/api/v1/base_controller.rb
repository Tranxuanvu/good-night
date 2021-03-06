module Api
  module V1
    class BaseController < ActionController::API
      include Pagy::Backend
      include Api::Response
      include Api::ExceptionHandler

      respond_to :json

      before_action :prepare_logged_in_user

      attr_reader :current_user

      protected

      def prepare_logged_in_user
        @current_user = Api::Authorize.new(request.headers).call
      end

      def authorize_user!
        raise AuthenticationError if @current_user.blank?
      end
    end
  end
end
