class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:read, :create], Food
    can %i[read create], Recipe
    return unless user.present?

    can :destroy, Food, user: user
    can :manage, Recipe, user: user
  end
end
