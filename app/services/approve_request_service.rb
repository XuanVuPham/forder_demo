class ApproveRequestService
  def initialize request
    @request = request
  end

  def add
    if @request.approved?
      shop_domain = ShopDomain.new shop_id: @request.shop.id,
        domain_id: @request.domain.id
      ActiveRecord::Base.transaction do
        if shop_domain.save!
          AddShopProductToDomainService.new(shop_domain.shop, shop_domain.domain).add
        end
      end
    end
  end
end
