ActiveAdmin.register CompetencyFramework, as:"Marcos de Competencias" do

    # Posición en la barra de menú.
    menu priority: 5

    # Como son datos exportados, las operaciones permitidas son ver y mostrar.
    actions :index, :show

    # Define los campos por los cuales podemos realizar filtros.
    filter :name, label:'Marco de competencias'
    
    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do
        selectable_column
        id_column
        column "Marco de competencias", :name
        column 'Identificador de Moodle', :moodle_idnumber
        actions
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
    show do
        attributes_table do
          row('Nombre'){ |r| r.name }
          row('Identificador de Moodle'){ |r| r.moodle_idnumber }
        end
    end  
end