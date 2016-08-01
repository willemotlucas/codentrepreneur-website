class Step < ApplicationRecord
	enum type: [:video, :instructions]
	belongs_to :task
end
