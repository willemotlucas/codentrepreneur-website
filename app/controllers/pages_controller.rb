class PagesController < ApplicationController
	def index
		@featured_project = PreorderProject.where(featured: 1).first
		@free_project = FreeProject.where(active: 1).last
	end
end
