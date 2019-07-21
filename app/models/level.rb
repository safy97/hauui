class Level < ApplicationRecord
	#association
	#has_many :posts #option to be added
 
	#validation
	validates :name , presence: true ,
					  :uniqueness => {case_sensitive: false}

	#call backs
end