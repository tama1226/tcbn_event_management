class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail from: "#{@contact.email}",
         to: "dic@example.com",
         subject: "ご予約のお問い合わせ"
  end
end
