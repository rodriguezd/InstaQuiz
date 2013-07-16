class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :answers
  has_many :quizzes, :through => :answers


  def score(quiz)
  	# total choices
  	total = self.answers.where(:quiz_id => quiz.id).size
  	
  	# correct choices
  	correct = 0
  	self.answers.each do |answer|
  		if answer.choice.correct
  			correct += 1 
  		end
  	end

  	# divide and return (correct choices/total choices)
  	((correct/total.to_f)*100).round
  end

end
