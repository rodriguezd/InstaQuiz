class AddInstructionsToQuiz < ActiveRecord::Migration
  def change
  	  	add_column :quizzes, :instruction, :text
  	  	add_column :quizzes, :deadline, :datetime

  end
end
