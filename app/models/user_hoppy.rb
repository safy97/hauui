class UserHoppy < ApplicationRecord
	#associations
	belongs_to :user
	belongs_to :hoppy
	belongs_to :level
	#validations

	validates :user , :uniqueness => {scope: :hoppy ,message: "every user can have a hoppy only one time"}
	#call backs
end