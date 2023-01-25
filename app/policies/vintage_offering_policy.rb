class VintageOfferingPolicy < ApplicationPolicy
  attr_reader :user, :vintage_offering

  def initialize(user, vintage_offering)
    @user = user
    @vintage_offering = vintage_offering
  end

  def index?
    user.is_seller
  end

  def new?
    user.is_seller
  end

  def create?
    user.is_seller
  end

  def show?
    user.is_seller
  end

  def update?
    user.is_seller
  end

  def edit?
    user.is_seller
  end

  def destroy?
    user.is_seller
  end
end
