class FreeProjectController < ApplicationController
	def show
		@project = FreeProject.friendly.find(params[:id])
		@rating = Rating.new
	end

	private
		def preorder_project_params
		end
end
