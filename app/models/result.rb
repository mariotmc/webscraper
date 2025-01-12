class Result < ApplicationRecord
  belongs_to :page

  def notify
    return unless success?
    UserMailer.success(page: page, result: self).deliver_later
  end
end
