class MailSender < ActionMailer::Base
  default from: 'from@example.com'

  def inquiry(inquiry)
    @inquiry = inquiry
    mail to: inquiry.email
  end
end
