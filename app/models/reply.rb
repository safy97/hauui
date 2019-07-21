class reply < ApplicationRecord
	#associations
	belongs_to :comment
	belongs_to :user

	#validations
	validates :content , presence: true


	#callbacks
end