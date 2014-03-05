class CreateDailyOffer < ActiveRecord::Migration
  def change
    create_table :daily_offers do |t|
      t.string :title, null: false
      t.string :image_path, null: false
      t.string :offer_link, null: false
      t.string :price, null: false
      t.references :author
      t.references :derby_entry
    end
  end
end
