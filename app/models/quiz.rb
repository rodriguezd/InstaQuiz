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

class Quiz < ActiveRecord::Base
  attr_accessible :name, :instruction, :deadline, :status, :instructor

  has_many :questions
  has_many :answers
  has_many :student_quizzes
  has_many :users, :through => :student_quizzes, :uniq => true
  has_many :results

  has_many :group_quizzes
  has_many :groups, :through => :group_quizzes


  after_initialize :init


  def editable_by?(user)
  	self.user_id == user
  end

  def take_email
    self.groups.each do |group|
      group.users.each do |user|
        UserMailer.take_quiz_email(user, self).deliver
        # UserMailer.take_quiz_email("David Rodriguez <davidrodriguez212@gmail.com>", self).deliver
      end
    end
  end

  def questions_email
    self.groups.each do |group|
      group.users.each do |user|
        UserMailer.submit_questions_email(user, self).deliver
      end
    end
  end

  def question_numbers
    size = self.questions.size
    (1..size).to_a
  end


  def performance_by_question 
    self.questions.collect do |question|
      question.average(self)
    end
  end

  def question_paths
    array = []
    self.questions.each do |question|
      array << "{ y: #{question.average(self)}, url: '/questions/#{question.id}/chart'}"
    end
    array.to_s.gsub('"', '')
  end

  private

  def init
    self.status ||= "pending"
  end

end
