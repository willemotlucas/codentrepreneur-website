class Task < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :taskable, presence: true
	validates :task_order, presence: true, numericality: true
	validates_uniqueness_of :task_order, scope: [:taskable]	

	# Relationships
  	belongs_to :taskable, polymorphic: true
  	has_many :steps

	attr_accessor :taskable_identifier

  	def display_name
  		taskable.title + " - " + title
  	end

    def subscriptionable_identifier=(taskable_data)
      if taskable_data.present?
        taskable_data = taskable_data.split('-')
        self.taskable_type = taskable_data[0]
        self.taskable_id = taskable_data[1]
      end
    end
end
