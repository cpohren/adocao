require 'test_helper'

class AdoptionMailerTest < ActionMailer::TestCase
  test "interested" do
    mail = AdoptionMailer.interested
    assert_equal "Interested", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
