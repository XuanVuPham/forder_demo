class Cart
  attr_reader :items
  attr_reader :domain_id

  def initialize domain_id, items = []
    @items = if items 
      items.map do |item_data|
        CartItem.new item_data["product_id"], item_data["shop_id"], item_data["quantity"]
      end
    else
      Array.new
    end  
    @domain_id = domain_id
  end

  def add_item product_id, shop_id
    item = @items.find{|item| item.product_id == product_id}
    if item
      item.increment
    else
      @items << CartItem.new(product_id, shop_id)
    end
  end

  def find_item product_id
    @items.find{|item| item.product_id == product_id}
  end

  def empty?
    @items.empty?
  end

  def count
    @items.length
  end

  def sort
    items = @items.map do |item|
      {product_id: item.product_id, quantity: item.quantity, shop_id: item.product.shop.id}
    end
    {items: items, domain_id: domain_id}
  end

  def total_price
    @items.inject(0){|sum, item| sum + item.total_price}
  end

  def delete_item items_by_shop
    items_by_shop.each do |item|
      items.delete item
    end
  end 
end
