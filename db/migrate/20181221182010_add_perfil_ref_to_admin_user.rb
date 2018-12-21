class AddPerfilRefToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :perfil, foreign_key: true
  end
end
