class Derby < ActiveRecord::Base

  has_many :derby_entries
  validates :derby_id, :begin_at, :end_at, :title, presence: true

end
