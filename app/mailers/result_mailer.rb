class ResultMailer < ApplicationMailer
  default from: 'Online Registration System <pragmaticbookself@gmail.com>'
  layout "mailer"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.result_mailer.send_result.subject
  #
  def send_result(result)
    @result = result

    mail to: result.first.user.email, subject: "Result of this semester"
  end
end
