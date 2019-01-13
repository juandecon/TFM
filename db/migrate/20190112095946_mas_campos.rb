class MasCampos < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments_competencies, :assignment_id, :integer
    add_column :assignments_competencies, :competency_id, :integer
  end
end
