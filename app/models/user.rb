class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_many :payments
  has_many :ratings
  has_many :paid_project_subscriptions, through: :subscriptions, source: :subscriptionable, source_type: 'PaidProject'
  has_many :free_project_subscriptions, through: :subscriptions, source: :subscriptionable, source_type: 'FreeProject'
  has_many :paid_project_payments, through: :payments, source: :paymentable, source_type: 'PaidProject'
  has_many :preorder_project_payments, through: :payments, source: :paymentable, source_type: 'PreorderProject'
  has_many :paid_project_ratings, through: :ratings, source: :ratingable, source_type: 'PaidProject'
  has_many :free_project_ratings, through: :ratings, source: :ratingable, source_type: 'FreeProject'

  enum user_role: {normal: "normal", admin: "admin"}
end
