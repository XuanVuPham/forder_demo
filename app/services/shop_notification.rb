class ShopNotification
  def initialize shop
    @shop = shop
    @admins = Admin.all
  end

  def send_when_requested
    AdminMailer.shop_owner_request(@shop.owner, @shop).deliver
    @admins.each do |admin|
      AdminMailer.shop_request(admin, @shop).deliver
    end
  end

  def send_when_confirmed
    UserMailer.delay.shop_confirmation(@shop.owner, @shop)
    @admins.each do |admin|
      AdminMailer.delay.shop_confirmation(admin, @shop)
    end
  end
end
