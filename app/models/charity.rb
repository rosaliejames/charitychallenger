class Charity < ActiveRecord::Base 
	has_many :challenges 
	belongs_to :challenges
end 