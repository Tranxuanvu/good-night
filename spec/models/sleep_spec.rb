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
require 'rails_helper'

RSpec.describe Sleep, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:go_to_bed_at) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user)}
  end
end
