class Author < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :catalog_link, presence: true

  def self.find_or_create(attrs)
    find_by(attrs.slice(:name)) || create(attrs)
  end

end
