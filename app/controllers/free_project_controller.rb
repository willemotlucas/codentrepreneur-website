class FreeProjectController < ApplicationController
	def show
		@free_project = FreeProject.where(slug: params[:id]).first
	end

	private
		def preorder_project_params
		end
end
