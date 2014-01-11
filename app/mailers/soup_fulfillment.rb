class SoupFulfillment < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.soup_fulfillment.match.subject
  #
  def match(fulfiller, requester, request)
    @greeting = "Hi"

    mail to: "#{fulfiller.email}, #{requester.email}", subject: "Dumpling King Match Made!"

  end
end
