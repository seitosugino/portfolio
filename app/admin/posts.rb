ActiveAdmin.register Post do
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
  permit_params :customer_id,:category_id,:title,:postal_code,:introduction,:title_image_id,:body,:body_image_id,:url,:star

  form do |f|
    f.inputs '投稿' do
      f.input :customer_id
      f.input :category_id
      f.input :title
      f.input :introduction
      f.input :title_image_id, :as => :file
      f.input :body
      f.input :body_image_id, :as => :file
      f.input :url
      f.input :star
    end
    f.actions
  end

end
