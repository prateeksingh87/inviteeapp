class NotificationMailer < ActionMailer::Base
 
 default from: 'your_mail@gmail.com'
 layout 'mailer'

  def send_signup_email(user)
   @user = user
   mail( to: @user.email, subject: 'Thanks for signing up for our amazing app' )
  end

  def accept_mail(invite)
   @invitie = invite
   mail( to: invite.address, subject: 'Received Referal invities' )
  end
end