ActiveAdmin.register Address do
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
    permit_params :customer_id,:name,:postal_code,:address
    
    form do |f|
    f.inputs '住所' do
      f.input :customer_id
      f.input :name
      f.input :postal_code
      f.input :address
    end
    f.actions
  end
    
end
