class UserMailer < ApplicationMailer
default from: 'sniffskincare@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def feedback(email, message)
    @email = email
    @message = message
    mail(to: 'sniffskincare@gmail.com', subject: 'FEEDBACK')
  end

  def verification(user, temp_pass)
    @user = user
    @temp = temp_pass
    mail(to: @user.email, subject: 'Account Verification')
  end

  def contact(email, message)
    @email = email
    @message = message
    mail(to: 'sniffskincare@gmail.com', subject: 'CONTACT')
  end

  def newsletter(email)
    # @url = 'http://localhost:3001/customize'
    attachments.inline["snifflogo1.png"] = File.read("#{Rails.root}/app/assets/images/snifflogo1.png")
    mail(to: email, subject: 'sniff. Newsletter!')
  end

  def signup_confirmation(user)
    @user = user
    @url = 'http://localhost:3001/customize'
    mail(to: @user.email, subject: 'Welcome to sniff.')
  end

  def order_confirmation(order)
    @order = order
    @url = 'http://localhost:3001/customize'
    attachments.inline["snifflogo1.png"] = File.read("#{Rails.root}/app/assets/images/snifflogo1.png")
# byebug
    if @order[:user_id]
      user = User.find(@order[:user_id])
      @total = @order[:total]
      mail(to: user[:email], subject: 'Order Confirmation')
    else
      @total = @order[:price]
      mail(to: @order[:email], subject: 'Order Confirmation')
    end
  end
end
