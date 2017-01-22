class AddOwnerToDomains < ActiveRecord::Migration[5.0]
  def change
    add_column :domains, :owner, :integer
  end
end
