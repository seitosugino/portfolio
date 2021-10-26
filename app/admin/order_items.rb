ActiveAdmin.register OrderItem do
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
  permit_params :order_id,:item_id,:price,:amount,:making_status

  form do |f|
    f.inputs 'ユーザー' do
      f.input :order_id
      f.input :item_id
      f.input :price
      f.input :amount
      f.input :making_status
    end
    f.actions
  end
end
