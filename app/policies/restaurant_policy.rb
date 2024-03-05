class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope == Restaurant
      if user.admin
        scope.all # pode ver todos os restaurantes
      else
        scope.where(user: user) # só pode ver os restaurantes que criou
      end
    end
  end

  def show?
    true # todos podem ver os detalhes de um restaurante
  end

  def create?
    true # todos podem criar um restaurante
  end

  def update?
    # somente o dono do restaurante pode editar
    owner?
  end

  def destroy?
    # somente o dono do restaurante pode apagar
    owner?
  end

  private

  def owner?
    # mesma coisa que current_user == @restaurant.user
    # user == current_user
    # record == @restaurant
    user == record.user
  end
end
