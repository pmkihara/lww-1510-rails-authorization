# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record
  # user = current_user
  # record = instância a ser autorizada

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false # ninguém está autorizado
  end

  def show?
    false  # ninguém está autorizado
  end

  def create?
    false  # ninguém está autorizado
  end

  def new?
    create? # seguir a mesma regra do #create?
  end

  def update?
    false  # ninguém está autorizado
  end

  def edit?
    update? # seguir a mesma regra do #update?
  end

  def destroy?
    false  # ninguém está autorizado
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
