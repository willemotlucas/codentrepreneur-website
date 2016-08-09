ActiveAdmin.register PreorderProject do

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
permit_params :title, :image_url, :video_url, :short_description, :duration, :featured, :active, :long_description, :slug, :original_price, :preorder_price, :release_date

controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end

end
