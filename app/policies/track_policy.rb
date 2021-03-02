class TrackPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user.has_role? :teacher
  end

  def new?
    create?
  end

  def update?
    @record.user == @user || user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    @user.has_role? :admin
  end

end
