class reply < ApplicationRecord
	#associations
	belongs_to :comment
	belongs_to :reply

	#validations
	validates :content , presence: true

	
	#callbacks
end