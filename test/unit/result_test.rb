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

require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
