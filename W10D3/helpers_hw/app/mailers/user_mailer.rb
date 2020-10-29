class UserMailer < ApplicationMailer
    default from: "aruman@wow.com"

    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: user.username, subject: 'Welcome to My Awesome Site')
    end
end
