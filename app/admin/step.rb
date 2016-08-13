ActiveAdmin.register Step do

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

permit_params :title, :step_type, :video_url, :video_duration, :slug, :explanations, :step_order

belongs_to :task

controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end

end
