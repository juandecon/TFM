class AddNewValuesToCompetencyFramework < ActiveRecord::Migration[5.2]
  def change
    add_column :competency_frameworks, :moodle_contextname, :string
  end
end
