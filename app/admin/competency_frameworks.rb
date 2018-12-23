ActiveAdmin.register CompetencyFramework, as:"Marcos de Competencias" do
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
menu priority: 5
#permit_params :nombre
actions :index, :show
index do
    selectable_column
    id_column
    column "Marco de competencia", :nombre
    column 'ID Moodle', :moodle_id
    column 'ID Contexto', :moodle_contextid
    column 'Nombre Contexto', :moodle_contextname
    column 'ID Number Moodle', :moodle_idnumber
    actions
end
filter :nombre, label:'Marco de competencia'
filter :moodle_id, label: 'ID Moodle'
filter :moodle_idnumber, label: 'ID Number Moodle'
end
