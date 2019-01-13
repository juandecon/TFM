class Cambiarrazonsocial < ActiveRecord::Migration[5.2]
  def change
    rename_column :empresas, :razonsocial, :name
  end
end
