class AddNumChoicesToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :num_choices, :integer
  end
end
