class RenameInstructionToInstructionsInQuiz < ActiveRecord::Migration
  def change
    rename_column :quizzes, :instruction, :instructions
  end

end
