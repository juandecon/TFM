class Assignment < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :competencies
  has_many :grades
  has_many :students, through: :grades

  def self.migrate_grades
    Assignment.find_each do |assignment|
      assignment.grades.clear
      result = Api::Assignment.grades(assignment.moodle_id.to_i)
      unless result.blank?
        result.each do |item|
          assignment.grades.create({
            score: item['grade'].to_s,
            moodle_userid: item['userid'].to_s,
            moodle_assignment_id: assignment.moodle_id,
            student: Student.find_by(moodle_id: item['userid'].to_s)
          })
        end
      end
    end
  end
end
