class DerbyEntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :image_path, :fog_of_war, :vote_count
end
