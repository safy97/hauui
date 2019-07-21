class Hoppy < ApplicationRecord
	#association
	belongs_to :hoppy_parent , class_name: 'Hoppy' , optional: true
	has_many :posts 
	has_many :user_hoppies , :dependent => :destroy
	has_many :users , through: :user_hoppies
	#validation
	validates :name , presence: true ,
					  :uniqueness => {case_sensitive: false}

	#call backs
end