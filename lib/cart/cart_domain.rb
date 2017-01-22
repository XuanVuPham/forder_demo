class CartDomain
  attr_reader :carts

  def initialize carts = []
    @carts = carts
  end

  class << self
    def build_from_hash hash
      carts = if hash
        hash["carts"].map do |cart|
          Cart.new cart["domain_id"], cart["items"]
        end
      else
        Array.new
      end
      new carts
    end
  end

  def add_cart current_cart, domain_id
    cart = @carts.find{|cart| cart.domain_id == domain_id}
    if cart
      cart = current_cart
    else
      @carts << Cart.new(domain_id)
    end
  end

  def update_cart 
    carts = @carts.map do |cart|
      items = []
      cart.items.each do |item|
        items << item.to_hash
      end
      {items: items, domain_id: cart.domain_id}
    end
    {carts: carts}   
  end 

  def to_hash
    hash = {}
    instance_variables.each do |var|
      hash[var.to_s.delete("@")] = instance_variable_get(var)
    end
    hash
  end
end
