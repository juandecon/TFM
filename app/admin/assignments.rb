ActiveAdmin.register Assignment do
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

    actions :index, :show
    

    filter :name, label: 'Nombre'
    filter :course, label: 'Curso' 
    filter :competencies, label: 'Competencia'

    filter :moodle_id, label: 'ID Moodle'
    filter :moodle_cmid, label: 'CMID Moodle'
    filter :duedate, label: 'Fecha de entrega'

    index do
        id_column
        column 'Nombre', :name
        column 'Curso', :course
        column 'ID Moodle', :moodle_id
        column 'CMID Moodle', :moodle_cmid
        column 'Fecha de entrega', :duedate
        actions
    end
end