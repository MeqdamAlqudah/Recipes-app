# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Food
    return unless user.present?
    can :destroy, Food, user: user
  end
end
