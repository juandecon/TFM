module Api
    class Assignment
  
      # llamada a función 'mod_assign_get_assignments'
      # 
      # Ej. params = { courseids: [1, 2], includenotenrolledcourses: 1 }
      # 
      # @param params Hash
      # - :courseids Array[Integer] Ids de curso en Moodle a filtrar
      # - :capabilities Array[String] ?
      # - :includenotenrolledcourses int (0|1). 0 para solo mostrar los cursos en la que esta matriculado el usuario del token
      def self.all(params = {})
        Moodle::Api.mod_assign_get_assignments(params)
      end
  
      # Obtiene los Assigments de un solo curso moodle
      # 
      # @param moodle_course_id Integer ID del curso en moodle
      def self.by_course(moodle_course_id = '')
        return [] if moodle_course_id.blank?
        params = { courseids: [moodle_course_id.to_i], includenotenrolledcourses: 1 }
        result = Moodle::Api.mod_assign_get_assignments(params)
        course = result['courses'].first
        return [] if course.blank?
  
        course['assignments']
      end
  
      def self.grades(moodle_assignment_id = '')
        return [] if moodle_assignment_id.blank?
  
        params = { assignmentids: [moodle_assignment_id] }
        result = Moodle::Api.mod_assign_get_grades(params)
        assignments = result['assignments']
        return [] if assignments.blank?
        assignments[0]['grades']
      end
    end
  end