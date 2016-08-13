ActiveAdmin.register Subscription do

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
	permit_params :user, :subscriptionable_identifier

    belongs_to :user

	form do |f|
		f.inputs "Subscription" do 
			f.input :user
			f.input :subscriptionable_identifier, label: 'Projet', as: :select, collection: (FreeProject.all + PaidProject.all).map { |i| [ "#{i.class.to_s} - #{i.title}", "#{i.class.to_s}-#{i.id}"] }
		end

		f.actions
	end

end
