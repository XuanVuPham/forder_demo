class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :message
      t.string :eventable_type
      t.integer :eventable_id
      t.string :eventitem_id
      t.boolean :read, default: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
