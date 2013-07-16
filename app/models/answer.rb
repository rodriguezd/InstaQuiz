class Answer < ActiveRecord::Base
  attr_accessible :choice_id, :user_id, :quiz_id

  belongs_to :choice
  belongs_to :user
  belongs_to :quiz
end