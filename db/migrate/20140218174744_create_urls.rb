class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original_url, :url_digest
      t.integer :visit_count
      t.timestamps
    end
  add_index :urls, :url_digest
  end
end
