class Hoppy < ApplicationRecord
	#association
	belongs_to :hoppy_parent , class_name: 'Hoppy' , optional: true
	has_many :posts
	#validation
	validates :name , presence: true ,
					  :uniqueness => {case_sensitive: false}

	#call backs
end