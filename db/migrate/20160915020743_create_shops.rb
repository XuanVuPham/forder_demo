class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.string :cover_image
      t.string :avatar
      t.float :averate_rating
      t.references :owner
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
