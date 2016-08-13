ActiveAdmin.register Payment do

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
	permit_params :user, :paymentable_identifier, :amount

	belongs_to :user

	form do |f|
		f.inputs "Payment" do 
			f.input :user, as: :select, collection: User.all
			f.input :paymentable_identifier, label: 'Projet', as: :select, collection: (PreorderProject.all + PaidProject.all).map { |i| [ "#{i.class.to_s} - #{i.title}", "#{i.class.to_s}-#{i.id}"] }
			f.input :amount
		end

		f.actions
	end

end
