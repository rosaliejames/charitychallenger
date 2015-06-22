class AddChallengerReferenceAndChallengeeReferenceToChallenges < ActiveRecord::Migration
  def change
    change_table :challenges do |t|
      t.references :challenger
      t.references  :challengee
    end
  end
end
