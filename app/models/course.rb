class Course < ApplicationRecord
  class Course < ApplicationRecord
    has_and_belongs_to_many :competencies
    has_and_belongs_to_many :students
    has_many :assignments
  
    def self.migrate
      courses = Api::Course.all
  
      courses.each do |item|
        c = Course.find_or_initialize_by(moodle_id: item['id'].to_s)
        c.moodle_id = item['id']
        c.moodle_shortname = item['shortname']
        c.moodle_fullname = item['fullname']
        c.name = item['displayname']
        c.startdate = Time.at(item['startdate'].to_i).to_datetime
        c.enddate = Time.at(item['enddate'].to_i).to_datetime
  
        c.save
      end
  
      # Asociar las competencias migradas
      Course.find_each do |course|
        course.migrate_assignments
        course.associate_competencies
        course.associate_assignment_competencies
        course.migrate_students
      end
    end
  
    def migrate_assignments
      moodle_assignments = Api::Assignment.by_course(moodle_id)
      moodle_assignments.each do |item|
        a = Assignment.find_or_initialize_by(moodle_id: item['id'].to_s)
        a.moodle_id = item['id'].to_s
        a.moodle_cmid = item['cmid'].to_s
        a.name = item['name'].to_s
        a.duedate = Time.at(item['duedate'].to_i).to_datetime
        a.course = self
  
        a.save
      end
    end
  
    def associate_competencies
      self.competencies.clear
      moodle_competencies = Api::Course.competencies(moodle_id)
      moodle_competencies.each do |item|
        c = Competency.find_by(moodle_id: item['competency']['id'].to_s)
        unless c.nil?
          self.competencies << c
        end
      end
      self.save
    end
  
    def associate_assignment_competencies
      # 1. Obtener datos de la API para relacionar assigments y competencias del curso
      api_competencies = Api::Course.detailed_competencies(self.moodle_id)
      return if api_competencies.blank?
  
      # 2. Obtener solo los datos necesarios
      array_competencies_assignments = api_competencies.map do |item|
        {
          competencyid: item['competency']['id'],
          assignmentscmids: item['coursemodules'].map { |cm| cm['id'] }
        }
      end
  
      # 3. Formatear los datos para facilitar la iteracion en assignments
      hash_assignment_competencies = {}
      array_competencies_assignments.each do |k|
        competencyid = k[:competencyid]
        k[:assignmentscmids].each do |j|
          hash_assignment_competencies[j] = [] if hash_assignment_competencies[j].nil?
          hash_assignment_competencies[j] << competencyid
        end
      end
  
      # 4. Asignar los datos encontrados en los assignments guardados
      self.assignments.each do |assignment|
        assignment.competencies.clear
  
        if hash_assignment_competencies.has_key?(assignment.moodle_cmid.to_i)
          hash_assignment_competencies[assignment.moodle_cmid.to_i].each do |moodle_competency_id|
            competency = Competency.find_by(moodle_id: moodle_competency_id.to_s)
            assignment.competencies << competency unless competency.nil?
          end
        end
        assignment.save
      end
    end
  
    def migrate_students
      self.students.clear
      moodle_enrollments = Api::Course.enrolled_users(self.moodle_id.to_i)
  
      return if moodle_enrollments.blank?
      moodle_enrollments.each do |item|
        student = Student.find_or_initialize_by(moodle_id: item['id'].to_s)
        student.firstname = item['firstname'].to_s
        student.lastname = item['lastname'].to_s
        student.moodle_id = item['id'].to_s
        student.save
  
        self.students << student
      end
    end
  end
end
