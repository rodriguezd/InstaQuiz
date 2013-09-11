# == Schema Information
#
# Table name: student_quizzes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  quiz_id     :integer
#  quiz_status :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StudentQuiz < ActiveRecord::Base

  attr_accessible :quiz_id, :user_id, :quiz_status

	belongs_to :quiz
	belongs_to :user

end
