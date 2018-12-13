class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :razonsocial
      t.string :cif
      t.string :domicilio
      t.string :localidad
      t.string :codigopostal
      t.string :email
      t.string :nombrerepresentante
      t.datetime :fechaoferta
      t.boolean :convenio
      t.string :actividad
      t.string :tutorempresa
      t.string :emailtutorempresa
      t.integer :numeroalumnos
      t.integer :alumnosasignados

      t.timestamps
    end
  end
end
