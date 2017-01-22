class AddDatetimeLimitToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :start_hour, :time
    add_column :products, :end_hour, :time
  end
end
