# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :email_confirmation

  validates_presence_of :name
  validates_uniqueness_of :email

  validates_presence_of :email
  validates_confirmation_of :email
  validates_presence_of :email_confirmation
  validates_presence_of :password
  validates_confirmation_of :password
  validates_presence_of :password_confirmation

  has_secure_password
  has_many :answers
  has_many :student_quizzes
  has_many :quizzes, :through => :student_quizzes, :uniq => true
  # has_many :quizzes, :through => :answers, :uniq => true
  has_many :questions

  has_many :role_users
  has_many :roles, :through => :role_users
  has_many :results

  has_many :group_users
  has_many :groups, :through => :group_users, :uniq => true



  def score(quiz)
  	# total choices
  	total = self.answers.where(:quiz_id => quiz.id).size
  	# correct choices
  	correct = 0
  	self.answers.where(:quiz_id => quiz.id).each do |answer|
  		if !answer.choice.nil? && answer.choice.correct
  			correct += 1
  		end
  	end
  	# divide and return (correct choices/total choices)
    score = 0
    unless total == 0
      score = ((correct/total.to_f)*100).round
    end
      self.results.create(:user_id => self.id, :quiz_id => quiz.id, :score => score)
    score
  end

  def class_average(quiz)
    if self.questions.where(:quiz_id => quiz.id).empty?
      "None"
    else
      questions = self.questions.where(:quiz_id => quiz.id)
      total_answers= questions.first.answers.size
      correct = questions.first.answers.collect{ |answer| answer.choice.correct ? 1 : nil}.compact.size
     if total_answers > 0
       score = ((correct/total_answers.to_f)*100).round
       score
      end
    end
  end

  def role?(type)
    self.roles.collect{|role| role.name}.include?(type.to_s)
  end

  def grade(group)
    quizzes_score = 0
    quizzes_count = 0
    if !group.quizzes.empty?
      group.quizzes.each do|quiz|
        quiz.results.where(:user_id => self.id).each do |result|
          quizzes_score = quizzes_score + result.score
          quizzes_count += 1
        end
      end
      if quizzes_count != 0
        (quizzes_score/quizzes_count.to_f).ceil
      else
        nil
      end
    end
  end

  def submitted_questions(quiz)
    self.questions.where(:quiz_id => quiz.id).size
  end

  def myprofile_chart_labels
    self.quizzes.where(:student_quizzes => {:quiz_status => "completed"}).collect{|quiz|quiz.name}
  end

  def myprofile_chart_data
    self.quizzes.where(:student_quizzes => {:quiz_status => "completed"}).collect do |quiz|
      if self.results.where(:quiz_id => quiz.id).first == nil
        0
      else
        self.results.where(:quiz_id => quiz.id).first.score
      end
    end
  end

end
