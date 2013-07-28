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

  validates_confirmation_of :email#, :message => "Emails do not match!"
  validates_presence_of :email_confirmation
  validates_confirmation_of :password#, :message => "Passwords do not match!"
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
  has_many :groups, :through => :group_users



  def score(quiz)
  	# total choices
  	total = self.answers.where(:quiz_id => quiz.id).size
  	# correct choices
  	correct = 0
  	self.answers.where(:quiz_id => quiz.id).each do |answer|
  		if answer.choice.correct
  			correct += 1
  		end
  	end

  def class_average(quiz)
    100
    # if self.questions.where(:quiz_id => quiz.id).empty?
    #   "None"
    # else
    #   correct = 0
    #   questions = self.questions.where(:quiz_id => quiz.id)
    #   total_answers= questions.first.answers.size
    #   questions.first.answers.each do |answer|
    #     if answer.choice.correct
    #       correct += 1
    #     end
    #   end
    #   correct/total_answers
    # end
  end

  	# divide and return (correct choices/total choices)
    score = 0
    unless total == 0
      score = ((correct/total.to_f)*100).round
    end
      self.results.create(:user_id => self.id, :quiz_id => quiz.id, :score => score)

    score
  end

  def role?(type)
    self.roles.collect{|role| role.name}.include?(type.to_s)
  end

end
