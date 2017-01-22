class CreateUserDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :user_domains do |t|
      t.references :user, foreign_key: true
      t.references :domain, foreign_key: true

      t.timestamps
    end
  end
end
