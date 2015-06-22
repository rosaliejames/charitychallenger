class AddChallengerCharityReferenceAndChallengeeCharityReference < ActiveRecord::Migration
  def change
  	 change_table :challenges do |t|
      t.references :challenger_charity
      t.references  :challengee_charity
    end
  end
end
