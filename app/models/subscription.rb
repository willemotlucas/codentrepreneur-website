class Subscription < ApplicationRecord
	# Validations
	validates :subscriptionable, presence: true
	validates_uniqueness_of :subscriptionable_id, scope: [:subscriptionable_type, :user]

	# Relationships
	belongs_to :subscriptionable, polymorphic: true
	belongs_to :user
end
