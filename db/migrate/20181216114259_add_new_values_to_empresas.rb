class AddNewValuesToEmpresas < ActiveRecord::Migration[5.2]
  def change
    add_column :empresas, :telefono, :string
  end
end
