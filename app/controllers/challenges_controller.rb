class ChallengesController < ApplicationController  
	before_action :authenticate_user!
	def new 
		@charities = Charity.all.collect {|p| [ p.name, p.id ] }
		@users = User.all.collect {|p| [ p.username, p.id ] }
		@challenge = Challenge.new
	end 

	def create 
		@challenge = Challenge.create(challenge_params.merge(:challenger_id => current_user.id, :accepted => false, :current_day => 1, :start_date => Date.today, :completed => false, :challengee_task => false, :challenger_task => false, :challenger_funds => 0.00, :challengee_funds => 0.00))
		@challenge.update(:end_date => @challenge[:total_days].days.from_now)
		#@challenge.update(:end_date => @challenge[:total_days].days_from_now)
		redirect_to pay_challenge_path(@challenge.id)
	end 

	def show 
		@challenge = Challenge.find(params[:id])
		# @day = UpdateWorker.perform(Challenge.find(params[:id]).current_day)
	end 

	def index
		@challenges = Challenge.all	
		 # @tester = UpdateWorker.perform

	end

	def edit
		@charities = Charity.all.collect {|p| [ p.name, p.id ] }
		@challenge = Challenge.find(params[:id])
	end 

	def update 
		#binding.pry
		@challenge = Challenge.find(params[:id])
		@challenge.update_attributes(params.require(:challenge).permit(:challengee_charity_id))
		@challenge.update_attributes(:accepted => true)
		#@challenge.update_attributes(params.require(:challengee_charity_id)) 
		redirect_to root_path
	end 

	private

	def challenge_params 
		params.require(:challenge).permit(:challengee_id, :challenge_description, :total_days, :challenger_charity_id)
	end 

	def buy
	@challenge = Challenge.find(params[:id])
    @amount = (@challenge.total_days * 100) # placeholder

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "#{@challenge.challenge_description}",
      :currency    => 'usd'
    )
    redirect_to root_path, notice: "Success! You are going to#{@challenge.challenge_description} :)"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
	end

end

