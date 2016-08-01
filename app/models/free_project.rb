class FreeProject < ApplicationRecord
	has_many :tasks, as: :taskable, dependent: :destroy
	has_many :subscriptions, as: :subscriptionable, dependent: :destroy
	has_many :ratings, as: :ratingable, dependent: :destroy
end
