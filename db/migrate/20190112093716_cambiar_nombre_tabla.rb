class CambiarNombreTabla < ActiveRecord::Migration[5.2]
  def change
    rename_table :perfils, :roles
  end
end
