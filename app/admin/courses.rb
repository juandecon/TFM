ActiveAdmin.register Course, as:"Asignatura" do

    # Posición en la barra de menú.
    menu priority: 8

    # Como son datos exportados, las operaciones permitidas son ver y mostrar.
    actions :index, :show

    # Define los campos por los cuales podemos realizar filtros.
    filter :name, label: 'Nombre' 
    filter :competencies, label: 'Competencia'

    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do
        id_column
        column 'Nombre', :name
        column 'ID Moodle', :moodle_id
        actions
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
    show do
        attributes_table do
        row('Nombre'){ |r| r.name }
        row('ID-Moodle'){ |r| r.moodle_id }
        end
    end
end