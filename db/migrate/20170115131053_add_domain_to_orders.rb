class AddDomainToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :domain, foreign_key: true
  end
end
