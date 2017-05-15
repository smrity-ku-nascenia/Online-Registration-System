class RegistrationInformationsPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if @user.role.equal?("Student")
        scope
      end
    end
  end

  def new? ; user_is_owner_of_this_record? ; end

  private
  def user_is_owner_of_this_record?
    @user = @record.user
  end
end
