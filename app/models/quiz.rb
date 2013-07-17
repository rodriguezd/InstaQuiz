class Quiz < ActiveRecord::Base
  attr_accessible :name

  has_many :questions
  has_many :answers
  has_many :users, :through => :answers, :uniq => true
end
