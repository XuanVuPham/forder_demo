class AddUserShopToDomainService
  def initialize user, domain
    @domain = domain
    @user = user
  end

  def add
    ActiveRecord::Base.transaction do
      @user.own_shops.each do |shop|
        unless shop.domains.present?
          shop_domain = ShopDomain.new shop_id: shop.id, domain_id: @domain.id
          if shop_domain.save!
            AddShopProductToDomainService.new(shop, @domain).add
          end
        end
      end
    end
  end
end
