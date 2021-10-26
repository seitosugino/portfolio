ActiveAdmin.register Item do
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
  permit_params :customer_id,:genre_id,:name,:introduction,:price,:is_active,:item_image_id,:url

  form do |f|
    f.inputs '投稿' do
      f.input :customer_id
      f.input :genre_id
      f.input :name
      f.input :introduction
      f.input :price
      f.input :is_active
      f.input :item_image_id, :as => :file
      f.input :url
    end
    f.actions
  end
end
