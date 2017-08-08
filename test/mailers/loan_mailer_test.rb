require 'test_helper'

class LoanMailerTest < ActionMailer::TestCase
  test "notify_user" do
    mail = LoanMailer.notify_user
    assert_equal "Notify user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_admin" do
    mail = LoanMailer.notify_admin
    assert_equal "Notify admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
