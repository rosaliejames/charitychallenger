class DailyReminderMailer < ApplicationMailer

  def reminder_email(user)
    @user = user
    mail(to: user.email, subject: 'Have you completed your challenge today?')
  end

  # TODO: make it so it also emails challengee - should it be reminder.user.email or reminder.challenger.email?

end