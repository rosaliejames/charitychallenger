class UpdateWorker


  # include Sidekiq::Worker
  # include Sidetiq::Schedulable

  # recurrence { daily }

  def self.perform #, completed)

          	
		end


  		#return Challenge.last.current_day(:current_day => (Challenge.last(:current_day) +1))


    end

  end

end
