class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.authenticated?

    if user.admin?
      can :manage, :all
    end
  end
end
