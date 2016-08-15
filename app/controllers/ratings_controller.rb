class RatingsController < ApplicationController
	before_action :authenticate_user!

	def create
		project = PaidProject.where(slug: params[:paid_project_id]).first || FreeProject.where(slug: params[:free_project_id]).first
		rating = Rating.new(rating_params)
		rating.ratingable = project
		rating.user = current_user
		rating.save

		if project.is_a? FreeProject
			redirect_to free_project_path(project)
		elsif project.is_a? PaidProject
			redirect_to paid_project_path(project)
		end
	end

	private
		def rating_params
			params.require(:rating).permit(:comment, :note)
		end
end
