class Like < ApplicationRecord
	#associations
	belongs_to :user
	belongs_to :post

	#validations
	validates :user ,  :uniqueness => {scope: :post , message: "user can like the post at most once"}

	#call backs
end