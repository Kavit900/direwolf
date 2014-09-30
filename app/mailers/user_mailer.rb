class UserMailer < ActionMailer::Base
  default from: "csc517@ncsu.edu"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, Subject: 'Welcome to Our Job Portal Site')
  end

end
