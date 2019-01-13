ActiveAdmin.register Category, as:"Curso" do

    # Posición en la barra de menú.
    menu priority: 7

    # Define los campos por los cuales podemos realizar filtros.
    filter :nombre

    # Los campos que se pueden introducir en el formulario
    permit_params :nombre

    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do 
        selectable_column
        id_column
        column "Curso", :nombre
        actions
    end
    
    # Reescribe el método form para mostrar el formulario con el formato y orden indicado
    form do |f|
        f.inputs do
            f.input :nombre, label:"Nombre"
        end
        f.actions do
            f.action :submit, label: "Guardar curso"
            f.action :cancel, :as => :link, label: 'Cancelar', wrapper_html: {class: :cancel}
        end  
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
  show do
    attributes_table do
      row('Nombre'){ |r| r.nombre }
    end
  end
end