class Result < ActiveRecord::Base
  attr_accessible :quiz_id, :score, :user_id

  belongs_to :quiz
  belongs_to :user
end
