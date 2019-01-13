ActiveAdmin.register Competency, as:"Competencias" do

    # Posición en la barra de menú.
    menu priority: 4

    # como son datos exportados, las operaciones permitidas son ver y mostrar.
    actions :index, :show

    # Define los campos por los cuales podemos realizar filtros.
    filter :name, label:'Competencia'
    filter :competency_framework, label:'Marco de competencias'

    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do
        id_column
        column 'Nombre', :name
        column 'Marco de competencias', :competency_framework
        actions
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
    show do
        attributes_table do
          row('Nombre'){ |r| r.name }
          row('Marco de competencias'){ |r| r.competency_framework }
        end
      end
end
