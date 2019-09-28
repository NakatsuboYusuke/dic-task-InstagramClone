class ConfirmMailer < ApplicationMailer

  def creation_email(picture)
    @picture = picture
    mail(
      subject: '投稿完了メール',
      to: 'nakatsubo.works@gmail.com',
      from: 'InstadrawApp'
    )
  end

end
