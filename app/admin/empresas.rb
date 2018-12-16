ActiveAdmin.register Empresa do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  menu priority: 6
  permit_params :razonsocial, :cif, :domicilio, :localidad, :codigopostal, :telefono, :email, 
                :nombrerepresentante, :fechaoferta, :convenio, :actividad, :tutorempresa,
                :emailtutorempresa, :numeroalumnos, :alumnosasignados
                
  filter :localidad
  filter :convenio
  filter :actividad
  filter :fechaoferta, label: 'Fecha oferta'    

  index do
        selectable_column
        id_column       
        column "Razón social", :razonsocial
        column "CIF", :cif
        column "Domicilio", :domicilio
        column "Localidad", :localidad
        column "Código Postal", :codigopostal
        column "Teléfono", :telefono
        column "E-mail", :email
        column "Nombre representante", :nombrerepresentante    
        column "Fecha oferta", :fechaoferta
        column "Convenio", :convenio
        column "Actividad", :actividad
        column "Tutor empresa", :tutorempresa
        column "E-mail tutor empresa", :emailtutorempresa
        column "Número alumnos", :numeroalumnos
        column "Alumnos asignados", :alumnosasignados
        actions
  end
  form do |f|
    tabs do
      tab 'Empresa' do
        f.inputs 'Datos de empresa' do
          f.input :razonsocial, label:"Razón social"
          f.input :cif, label:"CIF"
          f.input :domicilio, label:"Domicilio"
          f.input :localidad, label:"Localidad"
          f.input :codigopostal, label:"Código Postal"
          f.input :telefono, label:"Teléfono"
          f.input :email, label:"E-mail"
        end
      end

      tab 'Convenio', html_options: { class: 'specific_css_class' } do
        f.inputs 'Datos del convenio' do
          f.input :nombrerepresentante, label:"Nombre representante"
          f.input :fechaoferta, label:"Fecha de la oferta", as: :datepicker,
                                                            datepicker_options: {
                                                              min_date: "1-12-2018",
                                                              max_date: "300D",
                                                              regional: "es",
                                                              dateFormat: "dd/mm/yy"
                                                            }
          f.input :convenio, label:"Convenio"
          f.input :actividad, label:"Actividad"
          f.input :tutorempresa, label:"Tutor de empresa"
          f.input :emailtutorempresa, label:"E-mail Tutor de empresa"
          f.input :numeroalumnos, label:"Alumnos ofertados"
          f.input :alumnosasignados, label:"Alumnos asignados"
        end
      end
    end
    f.actions
  end

end
