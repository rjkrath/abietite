class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
        t.string :email, null: false
      t.timestamps
    end
  end
end
