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

require 'test_helper'

class GroupQuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
