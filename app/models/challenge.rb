class Challenge < ActiveRecord::Base 
	has_many :users 
	belongs_to :users
	has_many :charities 
	belongs_to :charities 
end 