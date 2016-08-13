class PreorderProject < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :short_description, presence: true
	validates :original_price, presence: true
	validates :preorder_price, presence: true

	# Relationships
	has_many :payments, as: :paymentable, dependent: :destroy
	belongs_to :paidProject, optional: true

	alias_attribute :price, :preorder_price

	def tags
		unless tags_list.blank?
			tags_list.gsub(" ","").split(',')
		end
	end

	def quantity_remaining
		if quantity > -1
			quantity - payments.count
		else
			quantity
		end
	end
end
