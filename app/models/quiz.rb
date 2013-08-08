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

class Quiz < ActiveRecord::Base
  attr_accessible :name, :instructions, :num_choices, :deadline_date, :deadline_time, :status, :instructor

  has_many :questions
  has_many :answers
  has_many :student_quizzes
  has_many :users, :through => :student_quizzes, :uniq => true
  has_many :results

  has_many :group_quizzes
  has_many :groups, :through => :group_quizzes, :uniq => true


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

  def contributor_count
    count = 0
    self.users.each do |user|
      if user.questions.where(:quiz_id => self.id, :status => "approved").empty? == false
        count += 1
      end
    end
    count
  end 

  def hardest_question_author
    hardest_hash = Hash.new
    lowest = 100
    name = ""

    unless self.questions.empty?
      self.questions.each do |question|
        if question.user && question.user.class_average(self).to_i < lowest
          lowest = question.user.class_average(self)
          name = question.user.name
        end
      end
      [name, lowest]
    end
  end

  def question_paths
    array = []
    self.questions.each do |question|
      array << "{ y: #{question.average(self)}, url: '/questions/#{question.id}/chart'}"
    end
    array.to_s.gsub('"', '')
  end

  def total_students
    self.users.size
  end

  def students_submitted
    submitted_student_hash = Hash.new
    self.users.collect do |student|
      unless student.results.where(:quiz_id => self.id).empty?
        if student.results.where(:quiz_id => self.id).first.score > 0
          submitted_student_hash[student.name] = student.results.where(:quiz_id => self.id).first.score
        end
      end
    end
    puts submitted_student_hash
    submitted_student_hash.size
  end

  private

  def init
    self.status ||= "pending"
  end

end
