class Review < ApplicationRecord

	#associations
	belongs_to :reviewer , class_name: "User"
	belongs_to :reviewee , class_name: "User"

	#validations
	validates :rate, numericality: {less_than_or_equal_to: 10.0}
	validates :reviewer , :uniqueness => {scope: :reviewee ,message: "you can add review at most once"}

	#callbacks
	before_create :add_the_rate
	before_destroy :remove_the_rate

	before_update :remove_the_rate_update
	after_update :add_the_rate_update
	private
	def add_the_rate
		reviewee = self.reviewee
		count = reviewee.reviewers.count.to_f
		rate = reviewee.rate
		rate = 0.0 if  rate == nil
		rate = rate * (count/(count+1.0)) + ((self.rate)/(count+1.0))
		reviewee.update(rate: rate)
	end

	def remove_the_rate
		reviewee = self.reviewee
		count = reviewee.reviewers.count.to_f
		rate = reviewee.rate
		rate = 0.0 if  rate == nil
		rate = (rate * (count) - (self.rate))
		if count != 1.0
			rate = rate / (count-1)
		else
			rate = nil
		end
		reviewee.update(rate: rate)
	end

	def remove_the_rate_update
		reviewee = self.reviewee
		count = reviewee.reviewers.count.to_f
		rate = reviewee.rate
		rate = rate  - ((self.rate_was)/(count))
		reviewee.update(rate: rate)
	end

	def add_the_rate_update
		reviewee = self.reviewee
		count = reviewee.reviewers.count.to_f
		rate = reviewee.rate
		rate = rate  + ((self.rate)/(count))
		reviewee.update(rate: rate)
	end
end