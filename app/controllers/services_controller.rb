class ServicesController < ApplicationController
# Los estudiantes a los que se le ha asignado una empresa, se almacenan en la tabla fct.
# Se almacena el id del estudiante y el id de la empresa.
  
    def asignar_empresa
        student_id = params[:student_id]
        empresa_id = params[:empresa_id]
    
        student = Student.find(student_id)
        empresa = Empresa.find(empresa_id)
    
        fct = nil
        if !student.fct?
          fct = Fct.create(student_moodle_id: student.moodle_id, empresa: empresa)
        end
    
        render json: { result: fct }
      end
end
