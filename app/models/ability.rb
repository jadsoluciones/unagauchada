class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= Usuario.new # guest user (not logged in)
    if user.rol == "Admin"
      can :manage, :all
    else if user.rol == "UsReg"
      can :destroy, Answer do |answer|
        answer.usuario == user
      end

      can :edit, Answer do |answer|
        answer.usuario == user
      end

      can :update, Answer do |answer|
        answer.usuario == user
      end

      can :create, Answer do |answer|
        answer.usuario == user
      end

      can :destroy, Question do |question|
        question.usuario == user
      end

      can :edit, Question do |question|
        question.usuario == user
      end

      can :update, Question do |question|
        question.usuario == user
      end

      can :create, Question do |question|
        question.usuario == user
      end

      can :destroy, Gauchada do |gauchada|
        gauchada.usuario == user
      end

      can :edit, Gauchada do |gauchada|
        gauchada.usuario == user
      end

      can :update, Gauchada do |gauchada|
        gauchada.usuario == user
      end

      can :create, Gauchada do |gauchada|
        gauchada.usuario == user
      end

      can :read, :all
    else
      can :read, :all
    end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
end
