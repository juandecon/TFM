class CambioColumnaPerfil < ActiveRecord::Migration[5.2]
  def change
    rename_column :perfils, :nombre, :name
  end
end
