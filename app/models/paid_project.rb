class PaidProject < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

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

	def tags
		unless tags_list.blank?
			tags_list.gsub(" ","").split(',')
		end
	end
end
