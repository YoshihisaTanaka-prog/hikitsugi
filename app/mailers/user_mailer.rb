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

  def sent_chat(chat)
    @chat = chat
    if chat.is_from
      mail(
        from: ENV['SMTP_USERNAME'],
        to:   ENV['SMTP_USERNAME'],
        subject: 'TRY 引継ぎシステム-チャットの通知'
      )
    else
      mail(
        from: ENV['SMTP_USERNAME'],
        to:   @chat.teacher.email,
        subject: 'TRY 引継ぎシステム-チャットの通知'
      )
    end
  end
end
