class AddTimeAutoRejectToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :time_auto_reject, :time, default: "00:30:00"
  end
end
