class CartItem
  attr_reader :product_id, :quantity, :shop_id

  def initialize product_id, shop_id, quantity = 1
    @product_id = product_id
    @quantity = quantity
    @shop_id = shop_id
  end

  def increment
    @quantity += 1
  end

  def decrement
    @quantity -= 1
  end

  def product
    Product.find product_id
  end

  def total_price
    product.price * quantity
  end

  def to_hash
    hash = {}
    instance_variables.each do |var|
      hash[var.to_s.delete("@")] = instance_variable_get(var)
    end
    hash
  end
end
