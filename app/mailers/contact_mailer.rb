class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "dic@example.com", subject: "お問い合わせ内容の確認"
  end
end
