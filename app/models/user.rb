# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # Validations
  validates :name, presence: true

  # Association
  has_many :followed_users, foreign_key: :follower_id, class_name: 'UserRelationship', dependent: :destroy
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'UserRelationship', dependent: :destroy
  has_many :followers, through: :following_users
  has_many :sleeps_time, class_name: 'Sleep', dependent: :destroy
end
