class AddSlugToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :slug, :string
  end
end
