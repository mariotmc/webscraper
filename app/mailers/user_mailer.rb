class UserMailer < ApplicationMailer
  def success(page:, result:)
    @page = page
    @result = result
    mail(to: "test@test.com", subject: "Page check success")
  end
end
