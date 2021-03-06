module Api
  module V1
    class AuthsController < Api::V1::BaseController
      def login
        user = User.find_by(id: params[:user_id])

        if user.blank?
          render_json(
            success: false,
            message: 'Invalid User Id'
          )
        else
          render_auth_info(user)
        end
      end

      private

      def render_auth_info(user)
        render_json(
          success: true,
          result: {
            user: UserSerializer.new(user),
            auth_token: JsonWebToken.encode(user_id: user.id)
          }
        )
      end
    end
  end
end
