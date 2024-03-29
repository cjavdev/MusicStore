class UserMailer < ActionMailer::Base
  default from: "cjavilla@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/"
    mail(to: user.email, subject: 'Welcome to My Music App')
  end
end
