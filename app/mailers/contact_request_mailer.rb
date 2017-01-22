class ContactRequestMailer < ApplicationMailer
  def to_user user, password
    @password = password
    @email = user.email
    mail to: user.email, subject: t("account_info")
  end
end
