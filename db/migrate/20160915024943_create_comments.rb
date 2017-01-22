class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :commentable, polymorphic: true, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
