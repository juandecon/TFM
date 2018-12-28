class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.string :score
      t.string :moodle_userid
      t.string :moodle_assignment_id
      t.references :assignment, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
