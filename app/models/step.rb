class Step < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :step_order, presence: true, numericality: true
	validates_uniqueness_of :step_order, scope: [:task]

	# Relationships
	enum step_type: {video: "video", instructions: "instructions"}
	belongs_to :task
end
