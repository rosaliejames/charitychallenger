# class UpdateWorker


#   # include Sidekiq::Worker
#   # include Sidetiq::Schedulable

#   # recurrence { daily }

#   def self.perform #, completed)


# 	Challenge.all.each do |challenge|


# 		if ( !(challenge[:completed]) && (challenge[:accepted]))
# 			Challenge.find(challenge.id).update(:current_day => (Challenge.find(challenge.id).current_day + 1))

# 		end

#   		# return Challenge.find(1).current_day


#     end

#   end

# end

 class UpdateWorker

 def self.perform #, completed)

	Challenge.all.each do |challenge|

	  if ( !(challenge[:completed]) && (challenge[:accepted]))
	    challenge.update_attributes(:current_day => (challenge[:current_day] + 1))
      #TODO: make it so that if its longer than totday, challenge is over 
	      if challenge[:total_days] > challenge[:current_day] 
	        challenge.update_attributes(:completed => true)
	      end 
 
 		

		      # if challenge[:challenger_task] 
		      #   challenge.update_attributes(:challenger_funds => (challenge[:challenger_funds] +1), :challenger_task => false)
		      # else 
		      #   challenge.update_attributes(:challengee_funds => (challenge[:challenger_funds] +1), :challenger_task => false)
		      # end 

		      # if challenge[:challengee_task] 
		      #   challenge.update_attributes(:challengee_funds => (challenge[:challenger_funds] +1), :challengee_task => false)
		      # else 
		      #   challenge.update_attributes(:challenger_funds => (challenge[:challenger_funds] +1), :challengee_task => false)
		      # end 

          	
	  end


  		#return Challenge.last.current_day(:current_day => (Challenge.last(:current_day) +1))


    end

  end

end


