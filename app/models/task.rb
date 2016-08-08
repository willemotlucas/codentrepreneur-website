class Task < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :taskable, presence: true
	validates :task_order, presence: true, numericality: true
	validates_uniqueness_of :task_order, scope: [:taskable]	

	# Relationships
  	belongs_to :taskable, polymorphic: true
  	has_many :steps
end
