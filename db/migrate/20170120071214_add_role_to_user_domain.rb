class AddRoleToUserDomain < ActiveRecord::Migration[5.0]
  def change
    add_column :user_domains, :role, :integer
  end
end
