class AddEntryPathAndStatusToDerbyEntry < ActiveRecord::Migration
  def change
    add_column :derby_entries, :active, :boolean, default: true
    add_column :derby_entries, :entry_link, :string
  end
end
