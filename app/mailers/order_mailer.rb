class OrderMailer < ApplicationMailer
  default from: 'phucdaica.pro@gmail.com'

  def send_confirmation(order)
    @order = order
    @user = @order.user
    mail to: @user.email, subject: "Order Confirmation"
  end
end
