class Choice < ActiveRecord::Base
  attr_accessible :content, :question_id, :correct

  belongs_to :question
  has_many :answers

  after_initialize :init

  def init
    self.correct ||= false
  end

end