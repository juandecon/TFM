class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :nombre
      t.datetime :startdate
      t.datetime :enddate
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
