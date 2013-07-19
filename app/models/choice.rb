# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  content     :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  correct     :boolean
#

class Choice < ActiveRecord::Base
  attr_accessible :content, :question_id, :correct

  belongs_to :question
  has_many :answers

  after_initialize :init

  def init
    self.correct ||= false
  end

end
