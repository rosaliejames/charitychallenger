class Challenge < ActiveRecord::Base 
	belongs_to :challenger, :class_name => "User"
	belongs_to :challengee, :class_name => "User"
	belongs_to :challenger_charity, :class_name => "Charity"
	belongs_to :challengee_charity, :class_name => "Charity"
end 