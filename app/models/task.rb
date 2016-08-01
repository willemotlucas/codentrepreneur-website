class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true
  has_many :steps
end
