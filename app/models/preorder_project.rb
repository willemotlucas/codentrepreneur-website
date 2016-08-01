class PreorderProject < ApplicationRecord
	has_many :payments, as: :paymentable, dependent: :destroy
	belongs_to :paidProject, optional: true
end
