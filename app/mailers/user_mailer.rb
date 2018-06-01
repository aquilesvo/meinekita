class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.alert.subject
  #
  def alert(user)
    @user = user
    @greeting = "Hallo " + @user.email

    mail(to: @user.email, subject: 'Vergiss nicht, deine Wunschkita erneut zu kontakieren!')
  end
end

