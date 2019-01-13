ActiveAdmin.register Assignment, as:'Tareas' do
    
    # Posición en la barra de menú.
    menu priority: 9

    # Como son datos exportados, las operaciones permitidas son ver y mostrar.
    actions :index, :show
    
    # Define los campos por los cuales podemos realizar filtros.
    filter :name, label: 'Nombre'
    filter :course, label: 'Asignatura' 
    filter :competencies, label: 'Competencia'

    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do
        id_column
        column 'Nombre', :name
        column 'Asignatura', :course
        column 'ID Moodle', :moodle_id
        column 'CMID Moodle', :moodle_cmid
        actions
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
    show do
        attributes_table do
          row('Nombre'){ |r| r.name }
          row('Asignatura'){ |r| r.course }
          row('CMID Moodle'){ |r| r.moodle_cmid }
        end
      end
end