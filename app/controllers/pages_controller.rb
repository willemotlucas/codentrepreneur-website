class PagesController < ApplicationController
	def index
		@featured_project = PreorderProject.where(featured: 1).first
		@free_project = FreeProject.where(active: 1).last
	end

	def projects
		@free_projects = FreeProject.where(active: true).order("created_at DESC")
		@paid_projects = PaidProject.where(active: true).order("created_at DESC")
		@preorder_projects = PreorderProject.where(active: true).order("created_at DESC")
	end
end
