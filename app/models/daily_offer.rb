class DailyOffer < ActiveRecord::Base

  belongs_to :author
  belongs_to :derby_entry

  validates :title, :image_path, :offer_link, :price, :author, :derby_entry, presence: true

end
