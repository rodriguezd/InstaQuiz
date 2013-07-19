# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  choice_id   :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quiz_id     :integer
#  question_id :integer
#

class Answer < ActiveRecord::Base
  attr_accessible :choice_id, :user_id, :quiz_id, :question_id

  belongs_to :choice
  belongs_to :user
  belongs_to :quiz
end
