ActiveAdmin.register Entry do
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
    permit_params :customer_id,:room_id
    
    form do |f|
    f.inputs 'カート' do
      f.input :customer_id
      f.input :room_id
    end
    f.actions
  end
end
