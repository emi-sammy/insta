class InstaMailer < ApplicationMailer
  def insta_mail(instagram)
    @instagram = instagram
    mail to: 'emi-sammy@joy.ocn.ne.jp', subject: 'お問い合わせの確認メール'
  end
end
