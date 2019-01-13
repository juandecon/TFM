ActiveAdmin.register Role, as:"Perfiles" do

    # Posición en la barra de menú.
    menu priority: 2

    # Los campos que se pueden introducir en el formulario
    permit_params :name, :code

    # Define los campos por los cuales podemos realizar filtros.
    filter :name, label:'Perfil'

    # Reescribe el método index para mostrar los datos con el formato y orden indicado
    index do
        selectable_column
        id_column
        column "Perfil", :name
        actions
    end

    # Reescribe el método show para mostrar los datos con formato de tabla.
    show do
        attributes_table do
            row('Nombre'){ |r| r.name }
            row('Código'){ |r| r.code }
        end
    end

     # Reescribe el método form para mostrar el formulario con el formato y orden indicado
    form do |f|
        f.inputs do
            f.input :name, label:"Nombre"
            f.input :code, label:"Código"
        end
        f.actions do
            f.action :submit, label: "Guardar perfil"
            f.action :cancel, :as => :link, label: 'Cancelar', wrapper_html: {class: :cancel}
        end  
    end    
end