class AddCategoryRefToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :category, foreign_key: true
  end
end
