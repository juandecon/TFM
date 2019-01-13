class CreateFcts < ActiveRecord::Migration[5.2]
  def change
    create_table :fcts do |t|
      t.integer :student_moodle_id
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
