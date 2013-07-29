# == Schema Information
#
# Table name: group_quizzes
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupQuiz < ActiveRecord::Base
  attr_accessible :group_id, :quiz_id

  belongs_to :group
  belongs_to :quiz

end
