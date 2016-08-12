class ApplicationMailer < ActionMailer::Base
  default from: 'Blissful Moments Photography Contact Form'
  default to: 'Camron Khan <camron.khan@gmail.com>'	#'Blissful Moments Photography <blissfulmomentsbystephanie@gmail.com>'
  layout 'mailer'
end