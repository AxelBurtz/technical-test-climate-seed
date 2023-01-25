class ProjectOfferingPolicy < ApplicationPolicy
  attr_reader :user, :project_offering

  def initialize(user, project_offering)
    @user = user
    @project_offering = project_offering
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
