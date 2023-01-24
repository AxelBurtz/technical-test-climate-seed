class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    user.is_admin
  end

  def new?
    user.is_admin
  end

  def create?
    user.is_admin
  end

  def show?
    user.is_admin
  end

  def update?
    user.is_admin
  end

  def edit?
    user.is_admin
  end

  def destroy?
    user.is_admin
  end
end
