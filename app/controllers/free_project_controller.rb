class FreeProjectController < ApplicationController
	def show
		@free_project = FreeProject.find(params[:id])
	end

	private
		def preorder_project_params
		end
end
