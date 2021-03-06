require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "alert" do
    mail = UserMailer.alert
    assert_equal "Alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  def alert
    user = User.first
    UserMailer.alert(user)
  end

end
