class ContactMailer < ActionMailer::Base
  default from: "family.computer59@gmail.com", 
          charset: 'UTF-8'
     
  def received_email(contact)
    @contact = contact
    mail(:to => @contact.email, :cc => "family.computer59@gmail.com", :subject => 'リクエストを承りました')
  end
end