# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Food
    can [:read, :create], Recipe
    return unless user.present?
    can :destroy, Food, user: user
    can [:update, :destroy], Recipe, user: user
  end
end
