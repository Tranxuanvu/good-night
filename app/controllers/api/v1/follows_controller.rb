module Api
  module V1
    class FollowsController < Api::V1::BaseController
      before_action :authorize_user!
      before_action :prepare_user, only: %i[create destroy]

      def create
        user_relationship = UserRelationship.new(follower_id: @current_user.id, followee_id: @user.id)

        if user_relationship.save
          render_json(
            success: true,
            message: 'Follow user successfully'
          )
        else
          render_json(
            success: false,
            message: 'Follow user unsuccessfully'
          )
        end
      end

      def destroy
        user_relationship = UserRelationship.find_by(follower_id: @current_user.id, followee_id: @user.id)

        return render_json(success: false, message: 'You still not follow this user yet') if user_relationship.blank?

        user_relationship.destroy

        render_json(
          success: true,
          message: 'Unfollow user successfully'
        )
      end

      private

      def prepare_user
        @user = User.find(params[:id])
      end
    end
  end
end
