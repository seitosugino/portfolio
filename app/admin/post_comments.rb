ActiveAdmin.register PostComment do
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
  permit_params :post_id,:customer_id,:comment
  
  form do |f|
    f.inputs 'いいね' do
      f.input :post_id
      f.input :customer_id
      f.input :comment

    end
    f.actions
  end

end
