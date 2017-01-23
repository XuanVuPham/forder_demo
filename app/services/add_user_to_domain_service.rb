class AddUserToDomainService
  def initialize user, domain
    @domain = domain
    @user = user
  end

  def add
    user_domain = UserDomain.new user_id: @user.id, domain_id: @domain.id, role: :owner
    ActiveRecord::Base.transaction do
      unless user_domain.save!
        return I18n.t "can_not_add_account"
      end
    end
  end
end
