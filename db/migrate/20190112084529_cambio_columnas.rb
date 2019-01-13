class CambioColumnas < ActiveRecord::Migration[5.2]
  def change
    rename_column :competencies, :nombre, :name
    rename_column :competency_frameworks, :nombre, :name
    rename_column :courses, :nombre, :name
    add_column :perfils, :code, :string
  end
end
