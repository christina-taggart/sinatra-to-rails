class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.string :title
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
