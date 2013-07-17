class Question < ActiveRecord::Base
  attr_accessible :content, :quiz_id, :status

  belongs_to :quiz
  has_many :choices

  after_initialize :init

  private

  def init
    self.status ||= "pending"
  end

end
