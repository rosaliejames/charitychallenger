class RemoveUserReferenceFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :user_id, :reference
    remove_column :challenges, :charity_id, :reference
  end
end
