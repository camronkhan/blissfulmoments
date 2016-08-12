class ApplicationMailer < ActionMailer::Base
  #default from: "contact-form@blissfulmomentsbystephanie.com"
  #default to: "Stephanie <stephanie@blissfulmomentsbystephanie.com>"
  #layout 'mailer'

  default from: "contact-form@camronkhan.com"
  default to: "Camron Khan <camron.khan@gmail.com>"
  layout 'mailer'
end