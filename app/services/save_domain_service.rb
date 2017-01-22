class SaveDomainService
  def initialize domain, user
    @domain = domain
    @user = user
  end

  def save
    ActiveRecord::Base.transaction do
      if @domain.save!
        AddUserToDomainService.new(@user, @domain).add
        return I18n.t "save_domain_successfully"
      else
        return I18n.t "save_domain_not_successfully"
      end
    end
  end
end
