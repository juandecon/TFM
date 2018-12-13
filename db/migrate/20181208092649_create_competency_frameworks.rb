class CreateCompetencyFrameworks < ActiveRecord::Migration[5.2]
  def change
    create_table :competency_frameworks do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
