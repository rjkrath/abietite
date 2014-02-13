class Voter < ActiveRecord::Base

  has_and_belongs_to_many :derby_entries

  validates :email, presence: true

end
