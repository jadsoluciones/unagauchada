class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= Usuario.new # guest user (not logged in)
    if user.rol == "Admin"
      alias_action :create, :read, :update, :destroy, :to => :admPuede1
      alias_action :create, :read, :destroy, :to  => :admPuede2
      alias_action :ver_listado, :update, :terminar, :cambiar_estado_concretada,
      :cambiar_estado_no_concretada, :to => :admPuede3
      alias_action :create, :update, :destroy, :cambiar_estado_aceptado, :cambiar_estado_rechazado, :to =>:post

      can :admPuede1, Logro
      can :admPuede2, Answer
      can :admPuede2,  Question
      can :admPuede2, Gauchada

      can :admPuede3, Gauchada do |gauchada|
        gauchada.usuario == user
      end

      can :update, Answer do |gauchada|
        gauchada.usuario == user
      end

      can :update, Question do |gauchada|
        gauchada.usuario == user
      end

      can :post, Postulacion

      can :read, :all

    else if user.rol == "UsReg"
      alias_action :read, :update, :destroy, :ver_listado, :terminar, :cambiar_estado_concretada,
      :cambiar_estado_no_concretada, :to => :urPuede
      alias_action :create, :update, :destroy, :cambiar_estado_aceptado, :cambiar_estado_rechazado, :to =>:post

      can :create, Answer
      can :urPuede, Answer do |answer|
        answer.usuario == user
      end
      can :create, Question
      can :urPuede, Question do |question|
        question.usuario == user
      end
      can :create, Gauchada

      can :urPuede, Gauchada do |gauchada|
        gauchada.usuario == user
      end

      can :post, Postulacion

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
