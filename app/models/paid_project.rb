class PaidProject < ApplicationRecord
	has_many :tasks, as: :taskable, dependent: :destroy
	has_many :subscriptions, as: :subscriptionable, dependent: :destroy
	has_many :payments, as: :paymentable, dependent: :destroy
	has_many :ratings, as: :ratingable, dependent: :destroy
	has_one :preorderProject
end
