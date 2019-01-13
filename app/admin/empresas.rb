ActiveAdmin.register Empresa do

  # Posición en la barra de menú.
  menu priority: 3

  # Los campos que se pueden introducir en el formulario
  permit_params :name, :cif, :domicilio, :localidad, :codigopostal, :telefono, :email, 
                :nombrerepresentante, :fechaoferta, :convenio, :actividad, :tutorempresa,
                :emailtutorempresa, :numeroalumnos, :alumnosasignados
   
  # Define los campos por los cuales podemos realizar filtros.              
  filter :localidad
  filter :convenio
  filter :actividad
  filter :fechaoferta, label: 'Fecha oferta'    

  # Reescribe el método index para mostrar los datos con el formato y orden indicado
  index do
        selectable_column
        id_column       
        column "Razón social", :name
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
        column "Cupo de alumnos", :numeroalumnos
        column "Alumnos asignados", :alumnosasignados
        actions
  end

  # Reescribe el método form para mostrar el formulario con el formato y orden indicado
  form do |f|
    tabs do
      tab 'Empresa' do
        f.inputs 'Datos de empresa' do
          f.input :name, label:"Razón social"
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
          f.input :numeroalumnos, label:"Cupo de alumnos"
          f.input :alumnosasignados, label:"Alumnos asignados"
        end
      end
    end
    f.actions do
      f.action :submit, label: "Guardar empresa"
      f.action :cancel, :as => :link, label: 'Cancelar', wrapper_html: {class: :cancel}
    end
  end

  # Reescribe el método show para mostrar los datos con formato de tabla.
  show do
    attributes_table do
      row('Razón social'){ |r| r.name }
      row('CIF'){ |r| r.cif }
      row('Domicilio'){ |r| r.domicilio }
      row('Localidad'){ |r| r.localidad }
      row('Código postal'){ |r| r.codigopostal }
      row('E-Mail'){ |r| r.email }
      row('Nombre representante'){ |r| r.nombrerepresentante }
      row('Fecha de la oferta'){ |r| r.fechaoferta }
      row('Convenio'){ |r| r.convenio }
      row('Actividad'){ |r| r.actividad }
      row('Tutor empresa'){ |r| r.tutorempresa }
      row('E-mail tutor empresa'){ |r| r.emailtutorempresa }
      row('Cupo de alumnos'){ |r| r.numeroalumnos }
      row('Alumnos asignados'){ |r| r.alumnosasignados }
    end
  end

end
