class CreateDomainService
  def initialize user
    @user = user
  end

  def create
    ActiveRecord::Base.transaction do
      domain = Domain.new(name: I18n.t("manage_domain.personal"), status: :default, owner: @user.id)
      if domain.save!
        AddUserToDomainService.new(@user, domain).add
        return I18n.t "save_domain_successfully"
      end
    end
  end
end
