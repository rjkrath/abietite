class DerbyEntry < ActiveRecord::Base

  belongs_to :derby
  has_and_belongs_to_many :voters

  validates :entry_id, :title, :image_path, presence: true
  validates :vote_count, presence: true, unless: :fog_of_war?

end
