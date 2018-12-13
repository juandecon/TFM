ActiveAdmin.register Category, as:"Curso" do
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
    menu priority: 7
    permit_params :nombre
    index do 
        selectable_column
        id_column
        column "Curso", :nombre
        actions
    end
    filter :nombre
end
