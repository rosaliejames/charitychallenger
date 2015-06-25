class UsersController < ApplicationController 
	before_action :authenticate_user!
	def show 
		@user = User.find(params[:id]) 
		@active_challenges = []
		@pending_challenges = [] 
		@completed_challenges = []
		@challenges = Challenge.where(:challenger_id => @user.id) + Challenge.where(:challengee_id => @user.id)
		@challenges.each do |challenge| 
			if challenge[:complete]
				@completed_challenges << challenge 
			elsif !challenge[:accepted] 
				@pending_challenges << challenge 
			else 
				@active_challenges << challenge
			end 
		end 

	end 

	def new
		@user = User.new(sign_up_params)
	end

	def profile
    	redirect_to "users/#{current_user.id}"
  	end

  	# def 

	# def sign_up_params 
	# 	devise_parameter_sanitizer.sanitize(:sign_up)
	# end 




end 