class CreateCompetencies < ActiveRecord::Migration[5.2]
  def change
    create_table :competencies do |t|
      t.string :nombre
      t.references :competency_framework, foreign_key: true

      t.timestamps
    end
  end
end
