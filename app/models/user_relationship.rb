# == Schema Information
#
# Table name: user_relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followee_id :bigint
#  follower_id :bigint
#
# Indexes
#
#  index_user_relationships_on_followee_id  (followee_id)
#  index_user_relationships_on_follower_id  (follower_id)
#
# Foreign Keys
#
#  fk_rails_...  (followee_id => users.id)
#  fk_rails_...  (follower_id => users.id)
#
class UserRelationship < ApplicationRecord
  # Assocications
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  # Validations
  validates :follower_id, :followee_id, presence: true
end
