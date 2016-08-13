class StepController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :find_step, only: [:show, :check_subscription]
	before_action :check_subscription, only: [:show]

	def show
		@project = @step.task.taskable
		@next_step = @step.task.steps.where("step_order > ?", @step.step_order).order("step_order ASC").first
		@previous_step = @step.task.steps.where("step_order < ?", @step.step_order).order("step_order DESC").first
	end

	private
		def step_params
		end

		def find_step
			@step = Step.friendly.find(params[:id])
		end

		def check_subscription
			if @step.task.taskable.is_a? FreeProject
				if !current_user.subscriptions.exists?(subscriptionable_type: @step.task.taskable_type, subscriptionable_id: @step.task.taskable_id)
					Subscription.create(user: current_user, subscriptionable: @step.task.taskable)
				end
			elsif @step.task.taskable.is_a? PaidProject
				unless current_user.subscriptions.exists?(subscriptionable_type: @step.task.taskable_type, subscriptionable_id: @step.task.taskable_id)
					flash[:error] = "Vous devez acheter la formation pour y accéder."
					redirect_to paid_project_path(@step.task.taskable)
				end
			end
		end
end
