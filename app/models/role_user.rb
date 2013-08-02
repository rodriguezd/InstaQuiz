# == Schema Information
#
# Table name: role_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoleUser < ActiveRecord::Base
  attr_accessible :role_id, :user_id, :group_id

  validates_presence_of :role_id

  belongs_to :role
  belongs_to :user
end
