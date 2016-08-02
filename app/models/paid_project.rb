class PaidProject < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :short_description, presence: true
	validates :price, presence: true

	# Relationships
	has_many :tasks, as: :taskable, dependent: :destroy
	has_many :subscriptions, as: :subscriptionable, dependent: :destroy
	has_many :payments, as: :paymentable, dependent: :destroy
	has_many :ratings, as: :ratingable, dependent: :destroy
	has_one :preorderProject
end
