class Challenge < ActiveRecord::Base 
	has_one :challenger, :class_name => "User"
	has_one :challengee, :class_name => "User"
	has_one :challenger_charity, :class_name => "Charity"
	has_one :challengee_charity, :class_name => "Charity"
end 