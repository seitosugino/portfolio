ActiveAdmin.register Group do
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
    permit_params :name,:introduction,:image_id,:owner_id
    
    form do |f|
    f.inputs 'カート' do
      f.input :name
      f.input :introduction
      f.input :image_id, :as => :file
      f.input :owner_id
    end
    f.actions
  end
end
