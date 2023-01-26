class ContributionPolicy < ApplicationPolicy
  attr_reader :user, :contribution

  def initialize(user, contribution)
    @user = user
    @contribution = contribution
  end

  def index?
    user.is_admin
  end

  def update?
    user.is_admin
  end
end
