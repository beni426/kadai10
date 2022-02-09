class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: @user.email, subject: "アカウント登録通知:"
  end
  def notify(user)
    @user = user
    mail to: @user.email, subject: "投稿通知: "
  end
end
