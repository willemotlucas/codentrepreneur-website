class Step < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :order, presence: true, numericality: true
	validates_uniqueness_of :order, scope: [:task]

	# Relationships
	enum step_type: {video: "video", instructions: "instructions"}
	belongs_to :task
end
