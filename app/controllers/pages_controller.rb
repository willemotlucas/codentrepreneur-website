class PagesController < ApplicationController
	def index
		@featured_project = PreorderProject.where(featured: "true").first
	end
end
