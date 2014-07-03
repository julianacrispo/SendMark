class ModelMailer < ActionMailer::Base
  default from: "julianacrispo@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(record)
    @record = record

    mail to: "julianacrispo@gmail.com", subject: "Success! You did it."
  end
end


#logic for sending/receiving email 