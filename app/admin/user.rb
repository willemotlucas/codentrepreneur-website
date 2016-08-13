ActiveAdmin.register User do

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

	sidebar "Relations de l'utilisateur", only: [:show, :edit] do
	    ul do
	      li link_to "Paiements",    admin_user_payments_path(user)
	      li link_to "Inscriptions", admin_user_subscriptions_path(user)
	    end
	end

end
