ActiveAdmin.register Task do

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
	permit_params :title, :description, :task_order, :taskable_identifier

	sidebar "Relations de la tâche", only: [:show, :edit] do
	    ul do
	      li link_to "Etapes",    admin_task_steps_path(task)
	    end
	end

	form do |f|
		f.inputs "Subscription" do 
			f.input :title
			f.input :description
			f.input :task_order
			f.input :taskable_identifier, label: 'Projet', as: :select, collection: (FreeProject.all + PaidProject.all).map { |i| [ "#{i.class.to_s} - #{i.title}", "#{i.class.to_s}-#{i.id}"] }
		end

		f.actions
	end

end
