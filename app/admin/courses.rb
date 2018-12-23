ActiveAdmin.register Course, as:"Asignatura" do
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
    menu priority: 8
    permit_params :nombre
    index do 
        selectable_column
        id_column
        column "Asignaturas", :nombre
        column "Fecha inicio", :startdate
        column "Fecha fin", :enddate
        actions
    end
    filter :nombre
    filter :category, label:'Curso'

    form do |f|
        f.inputs do
            f.input :category, label:"Curso"
            f.input :nombre, label:"Nombre"
            f.input :startdate, label:"Fecha inicio", as: :datepicker,
                                                                    datepicker_options: {
                                                                    min_date: "1-12-2018",
                                                                    max_date: "300D",
                                                                    regional: "es",
                                                                    dateFormat: "dd/mm/yy"
                                                                    }
            f.input :startdate, label:"Fecha fin", as: :datepicker,
                                                                    datepicker_options: {
                                                                    min_date: "1-12-2018",
                                                                    max_date: "300D",
                                                                    regional: "es",
                                                                    dateFormat: "dd/mm/yy"
                                                                   } 
        end
        f.actions
    end
end
