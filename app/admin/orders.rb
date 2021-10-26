ActiveAdmin.register Order do
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
  permit_params :customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status

  form do |f|
    f.inputs 'ユーザー' do
      f.input :customer_id
      f.input :postal_code
      f.input :address
      f.input :name
      f.input :shipping_cost
      f.input :total_payment
      f.input :payment_method
      f.input :status
    end
    f.actions
  end
end
