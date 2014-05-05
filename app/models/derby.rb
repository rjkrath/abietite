class Derby < ActiveRecord::Base

  has_many :derby_entries
  validates :derby_id, :begin_at, :end_at, :title, presence: true

  def self.get_current_derby
    Scrapers::DerbyPage.new.scrape
  end

end
