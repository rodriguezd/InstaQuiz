# == Schema Information
#
# Table name: quizzes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  instruction :text
#  deadline    :datetime
#  status      :string(255)
#

class Quiz < ActiveRecord::Base
  attr_accessible :name, :instruction, :deadline, :status

  has_many :questions
  has_many :answers
  has_many :student_quizzes
  has_many :users, :through => :student_quizzes, :uniq => true
  # has_many :users, :through => :answers, :uniq => true

  after_initialize :init


  def editable_by?(user)
  	self.user_id == user
  end

  
  def init
    self.status ||= "pending"
  end

end
