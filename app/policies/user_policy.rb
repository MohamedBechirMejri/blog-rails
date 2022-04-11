class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.present?
  end

  def update?
    @user.present? && @user == @record
  end

  def destroy?
    @user.present? && @user == @record
  end
end
