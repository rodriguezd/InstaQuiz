class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #user not logged in

    if user.role?(:instructor)
        # can :manage, :all
        can :create, Quiz
        
        can :manage, Quiz do |quiz|
            quiz.instructor == user.id
        end 

        can :manage, Question do |question|
            Quiz.find(question.quiz_id).instructor == user.id
        end

        can :manage, Group do |group|
            group.instructor == user.id
        end



        # can :manage, [Group, Question, Result, User, Quiz, Choice]
        # can :manage, Quiz
      else
        # can [:read], Quiz, :student_quizzes => {:quiz_status => true}
        can :read, :all
        can [:read, :new, :create, :chart], Question
        can [:edit, :update], Question, :user_id => user.id
        can [:take, :answers, :score, :submitted_questions, :chart], Quiz
        can :show, Quiz, :student_quiz => {:quiz_status => "completed"}
        can [:read, :leave, :join], Group
        # can [:update, :create], Answer
      end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
