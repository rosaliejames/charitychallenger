class UsersController < ApplicationController 
	before_action :authenticate_user!
	def show 
		@user = User.find(params[:id])
	end 

	def new
		@user = User.new(sign_up_params)
	end

	def create

	end

	# def sign_up_params 
	# 	devise_parameter_sanitizer.sanitize(:sign_up)
	# end 

end 