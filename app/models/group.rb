# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  instructor :integer
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :code, :instructor, :name

  has_many :group_users
  has_many :users, :through => :group_users, :uniq => true

  has_many :group_quizzes
  has_many :quizzes, :through => :group_quizzes

  def grade_all
     # returns average grades for all members of group and all quizzes
    quizzes_count = 0
    quizzes_scores = 0
      self.quizzes.each do |quiz|
        quizzes_scores = quizzes_scores + self.grade_quiz(quiz)
        quizzes_count += 1
      end
    (quizzes_scores/quizzes_count.to_f).ceil
  end

  def grade_quiz(quiz)
    # returns average grades for all members of group and all quizzes
      student_count = 0
      student_scores = 0
        quiz.users.where(:student_quizzes=>{:quiz_status=>"completed"}).each do |student|
          student_scores = student_scores + student.results.where(:quiz_id => quiz.id)
          student_count += 1
        end
      (student_scores/student_count.to_f).ceil
  end

end
