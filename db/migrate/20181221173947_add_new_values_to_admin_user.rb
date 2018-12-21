class AddNewValuesToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :nombre, :string
    add_column :admin_users, :apellidos, :string
  end
end
