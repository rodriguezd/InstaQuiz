# == Schema Information
#
# Table name: quizzes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  instruction :text
#  deadline    :datetime
#  status      :string(255)
#  instructor  :integer
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
