class CambiarTipoFct < ActiveRecord::Migration[5.2]
  def change
    change_column :fcts, :student_moodle_id, :string
  end
end
