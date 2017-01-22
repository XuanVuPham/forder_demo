class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_when_requested.subject
  #
  def shop_request user, shop
    @user = user
    @shop = shop.decorate
    mail to: user.email, subject: t(".subject", name: shop.name)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_when_confirmed.subject
  #
  def shop_confirmation user, shop
    @user = user
    @shop = shop.decorate
    mail to: user.email, subject: t(".subject", name: shop.name)
  end
end
