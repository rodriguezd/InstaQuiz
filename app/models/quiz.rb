class Quiz < ActiveRecord::Base
  attr_accessible :name, :instruction, :deadline

  has_many :questions
  has_many :answers
  has_many :users, :through => :answers, :uniq => true


  def editable_by?(user)
  	self.user_id == user
  end

end
