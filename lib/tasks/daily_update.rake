desc "Add 1 to current day and reset the button that checks whether or not the user has completed that day's challenge"

task :daily_update => :environment do

  puts "Updating ..."

  UpdateWorker.new.perform

  # ...
  puts "done."

end