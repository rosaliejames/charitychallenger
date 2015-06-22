class UpdateWorker


  # include Sidekiq::Worker
  # include Sidetiq::Schedulable

  # recurrence { daily }

  def perform ()#, completed)

  	Challenge.find(params[:id]).current_day += 1

  	return day

  	# if completed == true
   
  end

end