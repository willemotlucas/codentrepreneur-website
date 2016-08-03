class Payment < ApplicationRecord
	# Validations
	validates :amount, presence: true
	validates :paymentable, presence: true
	validates_uniqueness_of :paymentable_id, scope: [:paymentable_type, :user]

	# Relationships
  	belongs_to :paymentable, polymorphic: true
  	belongs_to :user
end
