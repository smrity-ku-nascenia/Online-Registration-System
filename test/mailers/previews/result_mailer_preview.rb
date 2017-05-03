# Preview all emails at http://localhost:3000/rails/mailers/result_mailer
class ResultMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/result_mailer/send_result
  def send_result
    ResultMailer.send_result
  end

end
