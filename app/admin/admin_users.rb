ActiveAdmin.register AdminUser, as:"Usuarios" do
      
  # Posición en la barra de menú.
  menu priority: 1

  # Los campos que se pueden introducir en el formulario  
  permit_params :nombre, :apellidos, :email, :password, :password_confirmation, :role_id, :empresa_id, 
                :category_id

  # Define los campos por los cuales podemos realizar filtros.
  filter :email
  filter :role, label:'Perfil'
  filter :category, label:'Curso'
  filter :empresa, label:'Empresa'              

  # Reescribe el método index para mostrar los datos con el formato y orden indicado                
  index do
    selectable_column
    id_column
    column "Nombre", :nombre
    column "Apellidos", :apellidos
    column "E-mail", :email
    column "Perfil", :role
    column "Curso", :category
    column "Empresa", :empresa
    actions
  end

  # Reescribe el método form para mostrar el formulario con el formato y orden indicado
  form do |f|
    f.inputs do
      f.input :nombre, label:"Nombre"
      f.input :apellidos, label:"Apellidos"
      f.input :email, label:"E-mail"
      f.input :role, label:"Perfil"
      f.input :category, label:"Curso"
      f.input :empresa, label:"Empresa"
      f.input :password, label:"Contraseña"
      f.input :password_confirmation, label:"Confirmar contraseña"
    end
    f.actions do
      f.action :submit, label: "Guardar usuario"
      f.action :cancel, :as => :link, label: 'Cancelar', wrapper_html: {class: :cancel}
    end  
  end

  # Reescribe el método show para mostrar los datos con formato de tabla.
  show do
    attributes_table do
      row('Nombre'){ |r| r.nombre }
      row('Apellidos'){ |r| r.apellidos }
      row('E-MAIL'){ |r| r.email }
      row('Perfil'){ |r| r.role }
      row('Curso'){ |r| r.category }
      row('Empresa'){ |r| r.empresa }
    end
  end

  # Para controlar cuando se está haciendo una modificación, si no se introducen los password
  # mantiene los que ya tenía.
  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
end