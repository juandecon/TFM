ActiveAdmin.register Competency, as:"Competencias" do
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
#permit_params :nombre, :competency_framework_id
actions :index, :show
index do
    selectable_column
    id_column
    column "Competencia", :nombre
    column "Marcos de competencias", :competency_framework
    column "Curso", :category
    actions
end
filter :nombre, label:'Competencia'
filter :competency_framework, label:'Marco de competencias'
filter :moodle_id, label: 'ID Moodle'
filter :moodle_idnumber, label: 'ID Number Moodle'
#belongs_to :competency_framework
index do
    id_column
    column 'Nombre', :nombre
    column 'Marco de competencia', :competency_framework
    column 'ID Moodle', :moodle_id
    column 'ID Number Moodle', :moodle_idnumber
    actions
  end
end
