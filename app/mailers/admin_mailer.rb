class AdminMailer < ApplicationMailer

  def shop_request admin, shop
    @admin = admin
    @shop = shop.decorate
    mail to: admin.email, subject: t(".subject", name: shop.name)
  end

  def shop_owner_request user, shop
    @user = user
    @shop = shop.decorate
    mail to: user.email, subject: t("shop_subject")
  end

  def shop_confirmation admin, shop
    @admin = admin
    @shop = shop.decorate
    mail to: admin.email, subject: t(".subject", name: shop.name)
  end
end
