class BlogCreatedMailer < ApplicationMailer
  def send_mail(message)
    @message = message
    mail to: "my_email@test.com", subject: "blog created successfully"
  end
end
