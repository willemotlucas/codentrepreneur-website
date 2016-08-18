class PaidProjectController < ApplicationController
	def show
		store_location_for(:user, paid_project_path)
		@project = PaidProject.friendly.find(params[:id])
		@rating = Rating.new
	end
end
