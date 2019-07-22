class User < ApplicationRecord
	has_one_base64_attached :avatar
	has_secure_password


	#associations
	has_many :devices, :dependent => :destroy
  has_many :posts , :dependent => :destroy
  has_many :user_hoppies , :dependent => :destroy

  has_many :reviewed_relationships , class_name: "Review" ,foreign_key: "reviewee_id", dependent:   :destroy
  has_many :reviewers ,through: :reviewed_relationships

  has_many :reviewing_relationships , class_name: "Review" ,foreign_key: "reviewer_id", dependent:   :destroy #i do this to delete all reviews made by the destroyed user 

	#validations

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :email, :length => { :maximum =>  70 },
                      :format => EMAIL_REGEX ,
                      :uniqueness => {case_sensitive: false},
                      :allow_nil => true

    validates :phone, :length => {:in => 7..11} ,
    				  :uniqueness => {scope: :country_code} ,
    				   allow_nil: true  #apply unique validation on {phone, country_code}
    validates :country_code , :length => {:in => 2..5} ,
    						   allow_nil: true,
    						   numericality: true
    validate :presence_uncompleted_phone


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
    def presence_uncompleted_phone
    	if (!! phone ^ !! country_code )
    		errors.add(:base, "phone number if present must have both  country code and phone value")
    	end
    end			      	        
end