class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def create?
      @user.present?
    end

    def destroy?
      @user.present? && (@record.user == @user)
    end
  end
end
