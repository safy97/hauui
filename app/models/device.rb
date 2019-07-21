class Device < ApplicationRecord
	#associations
	belongs_to :user

	#validations
	validates :uuid , presence: true
	validates :user , presence: true ,
					  :uniqueness => {scope: :uuid , message: "user and uuid must be unique"}
	#call backs


end