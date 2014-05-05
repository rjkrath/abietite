class RemoveEnteredAtFromDerbyEntries < ActiveRecord::Migration
  def change
    remove_column :derby_entries, :entered_at
  end
end
