class Post < ApplicationRecord
	has_many_base64_attached :images
	#associations
	belongs_to :hoppy
	belongs_to :level
	belongs_to :user
	has_many :post_links
	has_many :likes
	has_many :likers , through: :likes , source: :user
	has_many :comments
	#validations


	#call backs


end