class ContactMailer < ActionMailer::Base
  default from: "example@example.com"
  default to:"family.computer59@gmail.com"
     
  def received_email(contact)
    @contact = contact
    mail(:subject => 'リクエストを承りました')
  end
     
end