module Api
  module V1
    class SleepsController < Api::V1::BaseController
      before_action :authorize_user!

      def sleep_friends_past_week
        today = Time.zone.today
        start_date = today - today.wday - 6
        end_date = today - today.wday
        records = Sleeps::SleepFriendsService.new(current_user: @current_user, date_filter: [start_date, end_date]).call
        pagy, records = pagy(records)

        render_json(
          success: true,
          result: SleepSerializer.new(records),
          pagy: render_pagy(pagy)
        )
      end
    end
  end
end
