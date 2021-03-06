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
class SleepSerializer
  include JSONAPI::Serializer

  attributes :go_to_bed_at, :wake_up_at

  attribute :length_time do |object|
    time = object.length_time.to_f
    "#{time} hour".pluralize(time)
  end
end
