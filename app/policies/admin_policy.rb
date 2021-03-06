class AdminPolicy < ApplicationPolicy
  
  def new?
    user.full_access?
  end
  
  def edit?
    user.full_access?
  end
  
  def destroy?
    user.full_access?
  end

  def permit_attr
    if user.full_access?
      [:name, :email, :password, :password_confirmation, :role]
    else
      [:name, :email]  
    end
  end
  
  class Scope < Scope
    def resolve
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
