class Quiz < ActiveRecord::Base
  attr_accessible :name

  has_many :questions
end
