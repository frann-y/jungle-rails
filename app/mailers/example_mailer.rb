class ExampleMailer < ApplicationMailer
    default from: "no-reply@jungle.com" #special email

    def sample_email(order)
        @order = order
        mail(to: order.email, subject: "Order #: #{@order.id}")
      end
end