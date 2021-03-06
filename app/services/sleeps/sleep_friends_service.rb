module Sleeps
  class SleepFriendsService
    def initialize(current_user:, date_filter: [])
      @current_user = current_user
      @date_filter = date_filter.compact
      check_valid_argument
    end

    def call
      Sleep.includes(:user)
           .where(users: { id: @current_user.followee_ids })
           .where('DATE(go_to_bed_at) >= ? AND DATE(wake_up_at) <= ?', @date_filter[0], @date_filter[1])
           .order(:length_time)
    end

    private

    def check_valid_argument
      raise ArgumentError, 'date_filter must be a range of Date' if @date_filter.present? && @date_filter.reject { |item| item.is_a?(Date) }.present?
      raise ArgumentError, 'date_filter incorrect' if @date_filter.length < 2 || @date_filter[0] > @date_filter[1]
    end
  end
end
