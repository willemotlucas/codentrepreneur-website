class Rating < ApplicationRecord  	
	# Validations
	validates :ratingable, presence: true
	validates :note, presence: true, numericality: true
	validates_uniqueness_of :ratingable, scope: [:user]

	# Relationships
  	belongs_to :ratingable, polymorphic: true
  	belongs_to :user
end
