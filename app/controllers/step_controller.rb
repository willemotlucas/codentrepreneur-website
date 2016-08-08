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
			@step = Step.find(params[:id])
		end

		def check_subscription
			if @step.task.taskable.class.to_s == "FreeProject"
				if !current_user.subscriptions.exists?(subscriptionable_type: @step.task.taskable_type, subscriptionable_id: @step.task.taskable_id)
					print("Not subscribed yet")
					Subscription.create(user: current_user, subscriptionable: @step.task.taskable)
				end
			elsif @step.task.taskable.class.to_s == "PaidProject"
				if current_user.subscriptions.exists?(subscriptionable_type: @step.task.taskable_type, subscriptionable_id: @step.task.taskable_id)
					# Redirect to payment page
				end
			end
		end
end
