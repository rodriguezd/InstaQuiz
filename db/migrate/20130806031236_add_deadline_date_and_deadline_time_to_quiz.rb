class AddDeadlineDateAndDeadlineTimeToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :deadline_date, :date
    add_column :quizzes, :deadline_time, :time
  end
end
