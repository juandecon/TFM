class Removereference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :admin_users, :perfil, index: true, foreign_key: true
    add_reference :admin_users, :role, index: true, foreign_key: true
  end
end
