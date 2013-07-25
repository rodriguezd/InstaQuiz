class CreateGroupQuizzes < ActiveRecord::Migration
  def change
    create_table :group_quizzes do |t|
      t.integer :group_id
      t.integer :quiz_id

      t.timestamps
    end
  end
end
