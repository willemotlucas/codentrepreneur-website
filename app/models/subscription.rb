class Subscription < ApplicationRecord
	# Validations
	validates :subscriptionable, presence: true
	validates_uniqueness_of :subscriptionable, scope: [:user]

	# Relationships
	belongs_to :subscriptionable, polymorphic: true
	belongs_to :user
end
