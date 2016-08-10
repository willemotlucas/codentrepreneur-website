class PaidProjectController < ApplicationController
	def show
		@project = PaidProject.friendly.find(params[:id])
	end
end
