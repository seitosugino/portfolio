ActiveAdmin.register Relationship do
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
  permit_params :follower_id,:followed_id
  
  form do |f|
    f.inputs 'いいね' do
      f.input :follower_id
      f.input :followed_id

    end
    f.actions
  end

end
