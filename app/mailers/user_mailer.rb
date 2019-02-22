class UserMailer < ApplicationMailer
    default from: "no-reply@jungle.com"
    
    def receipt_email(user,order)
        @user = user
        @order = order
        mail(to: user.email, subject: 'Order has been placed')
    end
end

