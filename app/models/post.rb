class Post < ApplicationRecord
	has_many_base64_attached :images
	#associations
	belongs_to :hoppy
	belongs_to :level
	belongs_to :user
	has_many :post_links
	#validations


	#call backs


end