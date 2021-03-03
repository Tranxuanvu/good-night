# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'association' do
    it { is_expected.to have_many(:followed_users).dependent(:destroy).with_foreign_key('follower_id').class_name('UserRelationship') }
    it { is_expected.to have_many(:followees).through(:followed_users) }
    it { is_expected.to have_many(:following_users).dependent(:destroy).with_foreign_key('followee_id').class_name('UserRelationship') }
    it { is_expected.to have_many(:followers).through(:following_users) }
    it { is_expected.to have_many(:sleeps_time).dependent(:destroy) }
  end
end
