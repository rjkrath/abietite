class DerbyEntry < ActiveRecord::Base

  belongs_to :derby
  has_and_belongs_to_many :voters

  validates :entry_id, :title, :image_path, :vote_count, :entered_at, presence: true

end
