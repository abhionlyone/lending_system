class LoanMailer < ApplicationMailer

  default from: "from@example.com"

  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: 'Received request for loan')
  end


  def notify_admin(user)
    @user = user

    mail to: "to@example.org"
  end
end
