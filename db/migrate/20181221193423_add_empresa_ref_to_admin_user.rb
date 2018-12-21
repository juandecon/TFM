class AddEmpresaRefToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :empresa, foreign_key: true
  end
end
