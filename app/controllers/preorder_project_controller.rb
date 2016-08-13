class PreorderProjectController < ApplicationController
	def show
		store_location_for(:user, preorder_project_path)
		@preorder_project = PreorderProject.friendly.find(params[:id])
	end

	private
		def preorder_project_params
		end
end
