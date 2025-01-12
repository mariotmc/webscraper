class Page < ApplicationRecord
  CHECK_TYPES = %w[text exists not_exists]

  has_many :results, dependent: :destroy

  validates :name, presence: true
  validates :url, presence: true
  validates :check_type, presence: true, inclusion: { in: CHECK_TYPES }
  validates :selector, presence: true
  validates :match_text, presence: true, if: :text?

  def text?
    check_type == "text"
  end

  def run_check
    scraper = Scraper.new(url: url)

    result = case check_type
              when "text"
                scraper.text(selector: selector).downcase == match_text.downcase
              when "exists"
                scraper.present?(selector: selector)
              when "not_exists"
                !scraper.present?(selector: selector)
              end

    results.create(success: result)
  end
end
