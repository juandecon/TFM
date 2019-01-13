class MasCamposAdd < ActiveRecord::Migration[5.2]
  def change
    add_column :competencies_courses, :competency_id, :integer
    add_column :competencies_courses, :course_id, :integer

    add_column :courses_students, :course_id, :integer
    add_column :courses_students, :student_id, :integer
  end
end
