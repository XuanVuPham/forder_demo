class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.string :review
      t.references :user, index: true, foreign_key: true
      t.references :reviewable, polymorphic: true, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
