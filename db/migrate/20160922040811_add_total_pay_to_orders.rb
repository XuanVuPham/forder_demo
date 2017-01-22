class AddTotalPayToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total_pay, :float
  end
end
