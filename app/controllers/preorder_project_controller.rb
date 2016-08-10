class PreorderProjectController < ApplicationController
	def show
		@preorder_project = PreorderProject.friendly.find(params[:id])
	end

	private
		def preorder_project_params
		end
end
