# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  instructor :integer
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :code, :instructor, :name

  has_many :group_users
  has_many :users, :through => :group_users

  has_many :group_quizzes
  has_many :quizzes, :through => :group_quizzes

end
