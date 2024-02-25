class UserMailer < ApplicationMailer
  def ask_approve(old_teacher, new_teacher)
    @old_teacher = old_teacher
    @new_teacher = new_teacher
    mail(
      from: ENV['SMTP_USERNAME'],
      to:   @old_teacher.email,
      subject: '権限付与の依頼'
    )
  end
end
