# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Result < ActiveRecord::Base
  attr_accessible :quiz_id, :score, :user_id

  belongs_to :quiz
  belongs_to :user
end
