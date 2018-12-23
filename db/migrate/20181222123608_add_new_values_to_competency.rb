class AddNewValuesToCompetency < ActiveRecord::Migration[5.2]
  def change
    add_column :competencies, :moodle_id, :string
    add_column :competencies, :moodle_competencyframeworkid, :string
    add_column :competencies, :moodle_idnumber, :string
  end
end
