class AddDerbyIdToDerbyEntries < ActiveRecord::Migration
  def change
    change_table(:derby_entries) do |t|
      t.references :derby
    end
  end
end
