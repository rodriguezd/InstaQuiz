class CreateStudentQuizzes < ActiveRecord::Migration
 def change
    create_table :student_quizzes do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.string :quiz_status

      t.timestamps
    end
 end
end
