class GroupQuiz < ActiveRecord::Base
  attr_accessible :group_id, :quiz_id

  belongs_to :group
  belongs_to :quiz

end
