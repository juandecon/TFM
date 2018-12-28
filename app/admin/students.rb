ActiveAdmin.register Student do
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

    filter :firstname, label: 'Nombre'
    filter :lastname, label: 'Apellidos'
    filter :moodle_id, label: 'ID Moodle'
    filter :courses, label: 'Curso'

    index do
        id_column
        column 'Nombre', :firstname
        column 'Apellidos', :lastname
        column 'ID Moodle', :moodle_id
        actions
    end
end
