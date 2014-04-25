class DailyOffer < ActiveRecord::Base

  belongs_to :author
  accepts_nested_attributes_for :author

  belongs_to :derby_entry

  validates :title, :image_path, :offer_link, :price, :author, presence: true

  def self.find_or_create(attrs)
    find_by_offer_title(attrs.slice(:title)) || create_offer(attrs)
  end

  def self.get_current_offer
    ::Scrapers::FrontPage.new.scrape
  end

  private

  def self.find_by_offer_title(title_attr)
    find_by(title_attr)
  end

  def self.create_offer(attrs)
    author = Author.find_or_create(attrs.delete(:author))
    derby_entry = DerbyEntry.find_by(attrs.slice(:title))

    attrs.merge!(author: author, derby_entry: derby_entry)

    create(attrs)
  end

end
