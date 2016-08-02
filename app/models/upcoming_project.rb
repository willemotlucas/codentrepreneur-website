class UpcomingProject < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :short_description, presence: true
end
