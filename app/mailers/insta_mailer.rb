class InstaMailer < ApplicationMailer
  def insta_mail(instagram)
    @instagram = instagram
    @user = User.find_by(id: @instagram.user_id)
    mail to: @user.email, subject: 'Instagram投稿完了のお知らせ'
  end
end
