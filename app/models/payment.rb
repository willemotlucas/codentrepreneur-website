class Payment < ApplicationRecord
	# Validations
	validates :amount, presence: true
	validates :paymentable, presence: true
	validates_uniqueness_of :paymentable_id, scope: [:paymentable_type, :user]

	# Relationships
  	belongs_to :paymentable, polymorphic: true
  	belongs_to :user

  	attr_accessor :paymentable_identifier

    # def paymentable_identifier
    #   "#{paymentable.class.to_s}-#{paymentable.id}"
    # end

    def paymentable_identifier=(paymentable_data)
      if paymentable_data.present?
        paymentable_data = paymentable_data.split('-')
        self.paymentable_type = paymentable_data[0]
        self.paymentable_id = paymentable_data[1]
      end
    end
end
