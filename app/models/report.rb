class Report

  # Obtener el reporte de cualificaciones por estudiante
  # 
  # Retorna un hash con el formato:
  #  {
  #    10 => {
  #         :competency_framework_id => 10,
  #       :competency_framework_name => "Operación de redes departamentales",
  #                       :score_sum => 5.0,
  #                     :score_count => 1
  #    },
  #    11 => {
  #        :competency_framework_id => 11,
  #      :competency_framework_name => "Operación de sistemas informáticos",
  #                      :score_sum => 81.0,
  #                    :score_count => 12
  #    }
  #  }

  def self.qualification_by_student(student = nil)
    return [] if student.nil?

    # Obtener las notas del alunno dado
    student_grades = student.grades

    # Proyectar solo el campo score
    student_assignment_score = {}
    student_grades.each do |i|
      student_assignment_score[i.assignment_id] = i.score.to_f
    end

    # Obtener los IDs de assignments con notas del estudiante
    student_grades_assignment_ids = student_assignment_score.keys

    # Obtener todas las tareas asociadas a un CompetencyFramework
    all_competency_frameworks = []
    CompetencyFramework.find_each do |cf|
      all_competency_frameworks << {
        object: cf,
        assignments: cf.assignments.uniq
      }
    end

    # Purgar y filtrar usando solo las notas obtenidas por el alumno
    competency_framework_grades = {}
    all_competency_frameworks.each do |cf|

      # Objeto auxiliar para contabilizar y agrupar las notas
      competency_framework_grades[cf[:object].id] = {
        competency_framework_id: cf[:object].id,
        competency_framework_name: cf[:object].name,
        score_sum: 0.0,
        score_count: 0,
        score_avg: 0.0
      }

      # Solo calcular CompetencyFrameworks que tengan tareas asociadas
      if !cf[:assignments].empty?
        # Obtener solo las tareas del estudiante
        found_assignments = cf[:assignments].select {|a| student_grades_assignment_ids.include? a.id }

        # Usar las tareas encontradas para realizar calculos
        found_assignments.each do |found|
          competency_framework_grades[cf[:object].id][:score_count] += 1
          competency_framework_grades[cf[:object].id][:score_sum] += student_assignment_score[found.id]
        end
      end
    end

    competency_framework_grades = competency_framework_grades.map do |key, item|
      if item[:score_count] > 0
        item[:score_avg] = item[:score_sum] / item[:score_count]
      end
      item
    end
    competency_framework_grades
  end

  def self.consolidado
    # Formamos el hash con los datos resultantes
    result_competencias = {}
    CompetencyFramework.find_each do |cf|
      result_competencias[cf.id] = {
        competency_framework_id: cf.id,
        competency_framework_name: cf.name,
        empresas_count: 0,
        empresas_cupos_disponibles: 0,
        empresas_cupos_asignados: 0,
        students_count: 0
      }
    end

    # Obtenemos los reportes individuales de cada estudiante
    Student.find_each do |student|
      student_result = qualification_by_student(student)
      
      # Obtenemos la nota más alta del estudiante
      max_score = student_result.max_by { |item| item[:score_avg] }
      
      # Si se encuentra una nota, contabilizar el resultado
      if !max_score.blank?
        id = max_score[:competency_framework_id]
        result_competencias[id][:students_count] += 1
      end
    end

    result_competencias.each do |k, item|
      actividad = item[:competency_framework_name].strip
      Empresa.where(actividad: actividad).find_each do |empresa|
        item[:empresas_count] += 1
        item[:empresas_cupos_disponibles] += empresa.cupos_disponibles
        item[:empresas_cupos_asignados] += empresa.fcts.count
      end
    end

    result_competencias
  end
end