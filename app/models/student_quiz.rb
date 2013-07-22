class StudentQuiz < ActiveRecord::Base

  attr_accessible :quiz_id, :user_id, :quiz_status

	belongs_to :quiz
	belongs_to :user



end