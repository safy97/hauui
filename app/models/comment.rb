class Comment < ApplicationRecord
	#associations
	belongs_to :user
	belongs_to :post
	has_many :replies

	#validations
	validates :content , presence: true

	
	#call backs
end