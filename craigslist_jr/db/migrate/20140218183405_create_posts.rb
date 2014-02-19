class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.string :title, :body, :secret_url
      t.integer :price, default: 0
      t.timestamps
    end
  end
end
