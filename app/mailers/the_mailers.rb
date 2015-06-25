class TheMailers < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome!")
  end

  # def daily_reminder_email #took out a self.

  # 	User.all.each do |u|
  # 	# @user = user
  # 		mail(to: u.email, subject: "Have you completed your challenge today?")

  # 	end

  # end

  # TODO: make it so it also emails challengee - should it be reminder.user.email or reminder.challenger.email?

  # do we need a self. when integrating with whenever?
end