# == Schema Information
#
# Table name: sleeps
#
#  id           :bigint           not null, primary key
#  go_to_bed_at :datetime
#  wake_up_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_sleeps_on_user_id  (user_id)
#
FactoryBot.define do
  factory :sleep do
    go_to_bed_at { '2021-03-04 06:23:58' }
    wake_up_at { '2021-03-04 06:23:58' }
    user
  end
end
