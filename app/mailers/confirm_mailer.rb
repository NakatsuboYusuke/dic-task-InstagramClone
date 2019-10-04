class ConfirmMailer < ApplicationMailer

  def creation_email(picture)
    @picture = picture
    mail(
      subject: '投稿完了メール',
      to: @picture.user.email,
      from: 'InstadrawApp'
    )
  end

end
