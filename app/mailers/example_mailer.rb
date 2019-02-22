class ExampleMailer < ApplicationMailer
    default from: "no-reply@jungle.com" #special email

    def sample_email(user)
        @user = user
        mail(to: @user.email, subject: 'Sample Email')
      end
end