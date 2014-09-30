class ApplyMailer < ActionMailer::Base
  default from: "csc517@ncsu.edu"

  def new_app_email(apply)
    @apply = apply
    @employer = User.find_by_id(@apply.job.employee_id)
    mail(to: @employer.email, Subject: 'A new application for ${@apply.job.title} has come in')
  end

  def app_updated_email(apply)
    @apply = apply
    mail(to: @apply.user.email, Subject: 'Status update for ${@apply.job.title}')
  end

end