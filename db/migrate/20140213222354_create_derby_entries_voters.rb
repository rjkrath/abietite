class CreateDerbyEntriesVoters < ActiveRecord::Migration
  def change
    create_join_table(:derby_entries, :voters)
  end
end
