class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #user not logged in

    if user.role?(:instructor)

        can :create, Quiz

        can :create, Question

        can :create, Group

        can :manage, Quiz do |quiz|
            quiz.instructor == user.id
        end

        can [:update, :destroy, :read, :review, :approve, :chart], Question do |question|
            Quiz.find(question.quiz_id).instructor == user.id
        end

        can [:update, :destroy, :read, :grade, :chart, :list_members, :remove_student], Group do |group|
            group.instructor == user.id
        end

      else

        can [:create, :chart], Question # chart doesn't really belong here
        can [:edit, :update, :read], Question, :user_id => user.id
        can [:take, :answers, :score, :submitted_questions, :chart], Quiz
        can :show, Quiz, :student_quizzes => {:quiz_status => "completed"}
        can [:read, :leave, :join], Group
      end
  end
end
