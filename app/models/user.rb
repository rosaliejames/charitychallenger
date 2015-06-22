class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :challenges 
	#has_attached_file :avatar
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	# has_many :initiated_challenges, source: :challenger_id
 #  	has_many :received_challenges, source: :challengee_id

 #  	def challenges
 #    	initiated_challenges + received_challenges
 #  	end

end 