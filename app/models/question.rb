# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string(255)
#  user_id    :integer
#

class Question < ActiveRecord::Base
  attr_accessible :content, :quiz_id, :status, :user_id

  belongs_to :quiz
  belongs_to :user
  has_many :choices
  has_many :answers

  after_initialize :init

  def add_choices(choices, correct_choice)
      choices.each_with_index do |choice, i|
      choice = self.choices.build(:content => choice, :question_id => self.id)
      if i == correct_choice.to_i
        choice.correct = true
      end
      choice.save
    end
  end

  def update_choices(choices, correct_choice)
     self.choices.each_with_index do |c, i|
          c.update_attributes(:content => choices[i])
        if i == correct_choice.to_i
          c.correct = true
        else
          c.correct = false
        end
        c.save
      end
  end

  def change_status(approved_questions)

    if approved_questions.include?(self.id)
      self.status = "approved"
    else
      self.status = "pending"
    end
    self.save
  end

  def chart_labels
    self.choices.collect do |choice|
      if choice.correct
        choice.content+ "-correct"
      else
        choice.content
      end
    end
  end

  private

  def init
    self.status ||= "pending"
  end

end
