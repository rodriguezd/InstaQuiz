# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :role_users
  has_many :users, :through => :role_users

end
