class Subscription < ApplicationRecord
	# Validations
	validates :subscriptionable, presence: true
	validates_uniqueness_of :subscriptionable_id, scope: [:subscriptionable_type, :user]

	# Relationships
	belongs_to :subscriptionable, polymorphic: true
	belongs_to :user

	attr_accessor :subscriptionable_identifier

    # def paymentable_identifier
    #   "#{paymentable.class.to_s}-#{paymentable.id}"
    # end

    def subscriptionable_identifier=(subscriptionable_data)
      if subscriptionable_data.present?
        subscriptionable_data = subscriptionable_data.split('-')
        self.subscriptionable_type = subscriptionable_data[0]
        self.subscriptionable_id = subscriptionable_data[1]
      end
    end
end
