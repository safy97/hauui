class User < ApplicationRecord
	has_one_base64_attached :avatar
	has_secure_password


	#associations



	#validations

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :email, :length => { :maximum =>  70 },
                      :format => EMAIL_REGEX ,
                      :uniqueness => {case_sensitive: false},
                      :allow_nil => true

    validates :phone, :length => {:in => 7..11} , :uniqueness => {scope: :country_code } ,allow_nil: true  #apply unique validation on {phone, country_code}
    validates :country_code , :length => {:in => 2..5} ,allow_nil: true


    validate :presence_phone_or_email #at least phone number or email must be presence
    
    validates :long, numericality: true ,allow_nil: true
    validates :lat ,numericality:true , allow_nil: true
    validate :presence_uncompleted_location

    validates :rate, numericality: {less_than_or_equal_to: 10.0} ,allow_nil: true


    #call backs

    before_create :create_confirmation_code



    private
    def presence_phone_or_email
    	if !(email || (phone && country_code))
    		errors.add(:base, "To Create an account you must at least has email or phone number")
    	end
    end	

    def create_confirmation_code
    	confirm_code = (1..9).to_a.shuffle[0..3].join  #generate random four digits
    end

    def presence_uncompleted_location
    	if (!! long ^ !! lat)
    		errors.add(:base, "location if present must have both  longitude and latitude ")
    	end
    end			      	        
end