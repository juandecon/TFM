ActiveAdmin.register Student do
    #Nombre que se muestra en la barra de menú
    menu label: 'Alumnos'
    
    # Posición en la barra de menú.
    menu priority: 6

    # Como son datos exportados, las operaciones permitidas son ver y mostrar.
    actions :index, :show

    # Define los campos por los cuales podemos realizar filtros.
    filter :firstname, label: 'Nombre'
    filter :lastname, label: 'Apellidos'
    filter :empresa, label: 'Empresa'
 

    scope_to :current_admin_user, association_method: :my_students
    
    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do
        id_column
        column 'Nombre', :firstname
        column 'Apellidos', :lastname
        column 'ID Moodle', :moodle_id
        column 'Empresa', :empresa
        actions do |item|
          item 'Informe', report_admin_student_path(item)
        end
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
    show do
      attributes_table do
        row('Nombre'){ |r| r.firstname }
        row('Apellidos'){ |r| r.lastname }
        row('Empresa'){ |r| r.empresa }
      end
    end

      # Muestra el gráfico con las notas de los alumnos en cada marco de competencias
      member_action :report, method: :get, title: 'Informe de Cualificación Profesional' do
        report_result = Report.qualification_by_student(resource)
    
        max_avg = report_result.max_by {|item| item[:score_avg] }
        @student = resource
        @empresas = Empresa.con_disponibilidad(max_avg[:competency_framework_name].strip)
    
        @chart = LazyHighCharts::HighChart.new('graph') do |f|
          f.title(text: "Calificaciones del Alumno '#{@student.firstname} #{@student.lastname}'")
          names = []
          scores = []
          report_result.each do |item|
            names << item[:competency_framework_name]
            scores << item[:score_avg].round(2)
          end
    
          f.xAxis(categories: names)
          f.series(name: "Promedio de notas", yAxis: 0, data: scores)
           
          f.yAxis [
            {title: {text: "Promedio de notas", margin: 70} }
          ]
        
          f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'horizontal')
          f.chart({defaultSeriesType: "column"})
        end
      end
end