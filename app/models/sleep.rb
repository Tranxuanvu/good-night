# == Schema Information
#
# Table name: sleeps
#
#  id           :bigint           not null, primary key
#  go_to_bed_at :datetime
#  length_time  :decimal(, )
#  wake_up_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_sleeps_on_user_id  (user_id)
#
class Sleep < ApplicationRecord
  # Validation
  validates :go_to_bed_at, presence: true

  # Association
  belongs_to :user

  before_save :calculate_length_time_sleep

  private

  def calculate_length_time_sleep
    return if wake_up_at.blank?

    self.length_time = (wake_up_at - go_to_bed_at) / 1.hour
  end
end
