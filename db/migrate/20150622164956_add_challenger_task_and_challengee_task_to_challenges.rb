class AddChallengerTaskAndChallengeeTaskToChallenges < ActiveRecord::Migration
  def change
  	change_table :challenges do |t|
      t.boolean :challenger_task
      t.boolean  :challengee_task
    end
  end
end
