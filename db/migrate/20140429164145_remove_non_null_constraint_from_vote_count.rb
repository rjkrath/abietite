class RemoveNonNullConstraintFromVoteCount < ActiveRecord::Migration
  def change
    change_column :derby_entries, :vote_count, :integer, null: true
  end
end
