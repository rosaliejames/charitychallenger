class ChallengesController < ApplicationController 
	before_action :authenticate_user!
	def new 
		@challenge = Challenge.new()
	end 

	def create 
		@challenge = Challenge.create(sign_up_params)
		redirect_to "challenges/#{@challenge.id}"
	end 

	def show 
		@challenge = Challenge.find(params[:id])
	end 

	def index
		@challenges = Challenge.all	
	end

end 