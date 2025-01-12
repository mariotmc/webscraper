class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/success
  def success
    page = Page.joins(:results).first
    result = page.results.last
    UserMailer.success(page: page, result: result)
  end
end
