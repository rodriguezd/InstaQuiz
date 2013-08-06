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
        # can [:read], Quiz, :student_quizzes => {:quiz_status => true}
        # Group.joins(:group_users).where(:group_users => {:user_id => user.id})

        # a lot of these need to (or at least should) be according to whether
        # or not the student belongs to the group that the quiz or question belongs to

        can [:create, :chart], Question # chart doesn't really belong here
        can [:edit, :update, :read], Question, :user_id => user.id
        can [:take, :answers, :score, :submitted_questions, :chart], Quiz
        can :show, Quiz, :student_quizzes => {:quiz_status => "completed"}
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
