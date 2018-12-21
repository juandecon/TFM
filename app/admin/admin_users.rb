ActiveAdmin.register AdminUser, as:"Usuarios" do

  menu priority: 2
  permit_params :nombre, :apellidos, :email, :password, :password_confirmation, :perfil_id, :category_id,
                :empresa_id

  index do
    selectable_column
    id_column
    column "Nombre", :nombre
    column "Apellidos", :apellidos
    column "E-mail", :email
    column "Perfil", :perfil
    column "Curso", :category
    column "Empresa", :empresa
    #column :current_sign_in_at
    #column :sign_in_count
    #column :created_at
    actions
  end

  filter :email
  filter :perfil, label:'Perfil'
  filter :category, label:'Curso'
  filter :empresa, label:'Empresa'
  #filter :current_sign_in_at
  #filter :sign_in_count
  #filter :created_at

  form do |f|
    f.inputs do
      f.input :nombre, label:"Nombre"
      f.input :apellidos, label:"Apellidos"
      f.input :email, label:"E-mail"
      f.input :perfil, label:"Perfil"
      f.input :category, label:"Curso"
      f.input :empresa, label:"Empresa"
      f.input :password, label:"Contraseña"
      f.input :password_confirmation, label:"Confirmar contraseña"
    end
    f.actions
  end

end
