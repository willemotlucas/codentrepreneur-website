class MyProjectsController < ApplicationController
	before_action :authenticate_user!

	def index
		@free_projects = current_user.free_project_subscriptions
		@paid_projects = current_user.paid_project_subscriptions
		@preorder_projects = current_user.preorder_project_payments
	end
end
