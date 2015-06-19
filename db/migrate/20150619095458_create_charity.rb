class CreateCharity < ActiveRecord::Migration
  def change
    create_table :charities do |t|
    	t.string :name 
    	t.text :description
    end
  end
end
