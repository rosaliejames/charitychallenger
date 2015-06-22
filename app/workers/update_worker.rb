class UpdateWorker


  # include Sidekiq::Worker
  # include Sidetiq::Schedulable

  # recurrence { daily }

  def self.perform #, completed)


	Challenge.all.each do |challenge|


		if ( !(challenge[:completed]) && (challenge[:accepted]))
			Challenge.find(challenge.id).update(:current_day => (Challenge.find(challenge.id).current_day + 1))
			
		end

  		# return Challenge.find(1).current_day


    end

  end

end