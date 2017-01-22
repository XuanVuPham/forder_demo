class AddSlugToDomains < ActiveRecord::Migration[5.0]
  def change
    add_column :domains, :slug, :string
    add_index  :domains, :slug
  end
end
