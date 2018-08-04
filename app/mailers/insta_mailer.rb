class InstaMailer < ApplicationMailer
  def insta_mail(instagram)
    @instagram = instagram
    mail to: '自分のメールアドレス', subject: 'お問い合わせの確認メール'
  end
end
