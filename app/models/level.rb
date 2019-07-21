class Level < ApplicationRecord
	#association
	has_many :posts #dependent destroy ??
 	has_many :user_hoppies , :dependent => :destroy
	#validation
	validates :name , presence: true ,
					  :uniqueness => {case_sensitive: false}

	#call backs
end