class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
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
      @user.present? && (@record.user == @user)
    end

    def destroy?
      @user.present? && (@record.user == @user)
    end
  end
end
