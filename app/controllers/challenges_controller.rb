class ChallengesController < ApplicationController  
	before_action :authenticate_user!
	def new 
		@charities = Charity.all.collect {|p| [ p.name, p.id ] }
		@users = User.all.collect {|p| [ p.username, p.id ] }
		@challenge = Challenge.new
	end 

	def create 
		@challenge = Challenge.create(challenge_params.merge(:challenger_id => current_user.id, :accepted => false, :current_day => 1, :start_date => Date.today), :completed => false)
		@challenge.update(:end_date => @challenge[:total_days].days.from_now)
		#@challenge.update(:end_date => @challenge[:total_days].days_from_now)
		redirect_to '/challenges/'
	end 

	def show 
		@challenge = Challenge.find(params[:id])
	end 

	def index
		@challenges = Challenge.all	
	end

	private

	def challenge_params 
		params.require(:challenge).permit(:challengee_id, :challenge_description, :total_days, :challenger_charity_id)
	end 

end 