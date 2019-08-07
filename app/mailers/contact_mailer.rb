class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail from: "#{@contact.email}",
         to: "tachibanabowl7883115@gmail.com",
         subject: "ご予約のお問い合わせ"
  end
end
