class PostLink < ApplicationRecord
	belongs_to :post
	validates :link , presence: true
end