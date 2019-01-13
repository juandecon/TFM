class Fct < ApplicationRecord
  belongs_to :empresa
  has_one :student, foreign_key: "moodle_id", primary_key: 'student_moodle_id'

  validates :student_moodle_id, uniqueness: true

=begin
  def student
    Student.find_by(moodle_id: student_moodle_id)
  end
=end
end
