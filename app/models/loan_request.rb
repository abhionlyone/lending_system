class LoanRequest < ApplicationRecord
  belongs_to :user

  has_one :proof

  after_create :send_notification

  def send_notification
    LoanMailer.notify_user(self.user).deliver!
  end
end
