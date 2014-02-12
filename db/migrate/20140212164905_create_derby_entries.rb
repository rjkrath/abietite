class CreateDerbyEntries < ActiveRecord::Migration
  def change
    create_table :derby_entries do |t|
      t.string :entry_id, null: false
      t.string :title, null: false
      t.string :image_path, null: false
      t.boolean :fog_of_war, default: false
      t.integer :vote_count, default: 0, null: false
      t.datetime :entered_at, null: false
      t.timestamps
    end

    add_index :derby_entries, :entry_id
  end
end
