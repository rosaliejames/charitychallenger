class CreateChallenge < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.references :user, :name => :challenger_id
    	t.references :charity, :name => :challenger_charity 
    	t.float :challenger_funds

    	t.references :user, :name => :challengee_id
    	t.references :charity, :name => :challengee_charity 
    	t.float :challengee_funds

    	t.date :start_date 
    	t.date :end_date 
    	t.integer :current_day
    	t.integer :total_days

    	t.boolean :accepted

    	t.text :challenge_description

    end
  end
end
