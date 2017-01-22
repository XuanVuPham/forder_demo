class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.string :chatwork_id
      t.string :description
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
