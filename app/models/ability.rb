class Ability
  include CanCan::Ability

  def initialize user
    case user
    when Admin
      can :manage, :all
    when User
      can :read, :all
    else
      can :read, :all
    end
  end
end
