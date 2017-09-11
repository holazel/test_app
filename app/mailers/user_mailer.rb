
class UserMailer < ApplicationMailer
  default from: "dazeltodd@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
      :to => "dazeltodd@gmail.com",
      :subject => "A new contact form message from #{name}")
  end

end