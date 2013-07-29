class AddInstructorToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :instructor, :integer
  end
end
