class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short_url
      t.string :long_url
      t.belongs_to :user
      t.timestamps
    end
  end
end
