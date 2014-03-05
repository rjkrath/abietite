class Author < ActiveRecord::Base

  validates :name, :catalog_link, presence: true

end
