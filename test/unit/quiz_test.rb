# == Schema Information
#
# Table name: quizzes
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructions  :text
#  status        :string(255)
#  instructor    :integer
#  deadline_time :time
#  num_choices   :integer
#  deadline_date :date
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
