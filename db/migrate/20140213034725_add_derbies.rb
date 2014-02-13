class AddDerbies < ActiveRecord::Migration
  def change
    create_table :derbies do |t|
      t.integer :derby_id, null: false
      t.datetime :begin_at, null: false
      t.datetime :end_at, null: false
      t.string :title, null: false
      t.boolean :open, default: false
    end

    add_index :derbies, :derby_id
  end
end
