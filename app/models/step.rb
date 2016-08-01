class Step < ApplicationRecord
	enum step_type: {video: "video", instructions: "instructions"}
	belongs_to :task
end
