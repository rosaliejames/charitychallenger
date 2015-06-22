class UpdateWorker


  # include Sidekiq::Worker
  # include Sidetiq::Schedulable

  # recurrence { daily }

  def self.perform #, completed)


	Challenge.all.each do |challenge|


		if ( !(challenge[:completed]) && (challenge[:accepted]))
			Challenge.find(challenge.id).update_attributes(:current_day => (Challenge.find(challenge.id).current_day + 1))
      #TODO: make it so that if its longer than totday, challenge is over 
      if challenge[:total_days] > challenge[:current_day] 
        challenge.update_attributes(:completed => true)
      end 

      #check tasks 
      #update funds accordingly 
      #reset tasks 

      if challenge[:challenger_task] 
        challenge.update_attributes(:challenger_funds => challenge[:challenger_funds] +1, :challenger_task: => false)
      else 
        challenge.update_attributes(:challengee_funds => challenge[:challenger_funds] +1, :challenger_task: => false))
      end 

      if challenge[:challengee_task] 
        challenge.update_attributes(:challengee_funds => challenge[:challenger_funds] +1, :challengee_task: => false)
      else 
        challenge.update_attributes(:challenger_funds => challenge[:challenger_funds] +1, :challengee_task: => false))
      end 


          	
		end


  		# return Challenge.find(1).current_day


    end

  end

end