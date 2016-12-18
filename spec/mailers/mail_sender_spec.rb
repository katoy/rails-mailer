require 'rails_helper'

RSpec.describe MailSender, type: :mailer do
  describe 'inquiry' do
    let(:inquiry) { build(:inquiry, subject: '件名', email: 'to@example.com', message: '本文') }
    let(:mail) { MailSender.inquiry(inquiry) }

    it 'renders the headers' do
      # expect(mail.subject).to eq('件名')
      expect(mail.to).to eq(['to@example.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('本文')
    end
  end
end
