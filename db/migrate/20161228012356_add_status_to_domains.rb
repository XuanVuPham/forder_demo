class AddStatusToDomains < ActiveRecord::Migration[5.0]
  def change
    add_column :domains, :status, :integer
  end
end
