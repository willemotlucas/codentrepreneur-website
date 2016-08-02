class PreorderProject < ApplicationRecord
	# Validations
	validates :title, presence: true, length: {maximum: 255}
	validates :short_description, presence: true
	validates :original_price, presence: true
	validates :preorder_price, presence: true

	# Relationships
	has_many :payments, as: :paymentable, dependent: :destroy
	belongs_to :paidProject, optional: true
end
