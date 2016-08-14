class User < ApplicationRecord
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_create :generate_referral_code

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relationships
  has_many :subscriptions
  has_many :payments
  has_many :ratings

  # Relationships through association tables
  has_many :paid_project_subscriptions, through: :subscriptions, source: :subscriptionable, source_type: 'PaidProject'
  has_many :free_project_subscriptions, through: :subscriptions, source: :subscriptionable, source_type: 'FreeProject'
  has_many :paid_project_payments, through: :payments, source: :paymentable, source_type: 'PaidProject'
  has_many :preorder_project_payments, through: :payments, source: :paymentable, source_type: 'PreorderProject'
  has_many :paid_project_ratings, through: :ratings, source: :ratingable, source_type: 'PaidProject'
  has_many :free_project_ratings, through: :ratings, source: :ratingable, source_type: 'FreeProject'

  # User type enumeration
  enum user_role: {normal: "normal", admin: "admin"}

  # Use by Active Admin to better display the record
  def display_name
    first_name + " " + last_name + " - " + email
  end 

  def full_name
    first_name + " " + last_name
  end

  private
  	def generate_referral_code
  		referral_code = ""
  		loop do
  			o = [('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
			referral_code = (0...8).map { o[rand(o.length)] }.join
			break if !User.where(referral_code: referral_code).exists?
		end
		self.referral_code = referral_code
  	end
end
