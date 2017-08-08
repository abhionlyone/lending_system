# Preview all emails at http://localhost:3000/rails/mailers/loan_mailer
class LoanMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loan_mailer/notify_user
  def notify_user
    LoanMailer.notify_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/loan_mailer/notify_admin
  def notify_admin
    LoanMailer.notify_admin
  end

end
