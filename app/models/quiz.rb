class Quiz < ActiveRecord::Base
  attr_accessible :name, :instruction, :deadline, :status

  has_many :questions
  has_many :answers
  has_many :users, :through => :answers, :uniq => true

  after_initialize :init


  def editable_by?(user)
  	self.user_id == user
  end

  
  def init
    self.status ||= "pending"
  end

end
