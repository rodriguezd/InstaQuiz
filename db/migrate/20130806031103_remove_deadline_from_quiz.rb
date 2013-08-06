class RemoveDeadlineFromQuiz < ActiveRecord::Migration
  def up
    remove_column :quizzes, :deadline
  end

  def down
    add_column :quizzes, :deadline, :datetime
  end
end
