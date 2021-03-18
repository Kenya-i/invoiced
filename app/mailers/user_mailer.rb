class UserMailer < ApplicationMailer
  def welcome_email
    @email = params[:user][:email]
    debugger

    mail(to: @email, subject: "私の素敵なサイトへようこそ")
  end
end
