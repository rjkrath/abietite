class DerbyEntry < ActiveRecord::Base

  validates :entry_id, presence: true, format: { with: /\d+/ }

  validates :title, :image_path, :vote_count, :entered_at, presence: true
end
