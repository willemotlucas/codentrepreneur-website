class PagesController < ApplicationController
	def index
		@featured_project = PreorderProject.where(featured: 1).first
	end
end
