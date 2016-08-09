class FreeProject < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :short_description, presence: true

	# Relationships
	has_many :tasks, as: :taskable, dependent: :destroy
	has_many :subscriptions, as: :subscriptionable, dependent: :destroy
	has_many :ratings, as: :ratingable, dependent: :destroy
end
