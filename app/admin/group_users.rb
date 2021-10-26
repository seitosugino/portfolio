ActiveAdmin.register GroupUser do
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
    permit_params :group_id,:customer_id,:content
    
    form do |f|
    f.inputs 'カート' do
      f.input :group_id
      f.input :customer_id
      f.input :content
    end
    f.actions
  end
end
