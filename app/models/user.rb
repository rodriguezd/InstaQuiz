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
  attr_accessible :email, :name, :password
  has_secure_password
  has_many :answers
  has_many :quizzes, :through => :answers, :uniq => true
  has_and_belongs_to_many :roles



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

  	# divide and return (correct choices/total choices)
  	((correct/total.to_f)*100).round
  end

end
