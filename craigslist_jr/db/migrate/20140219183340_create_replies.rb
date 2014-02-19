class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :post
      t.string :name, :email
      t.text :text
      t.timestamps
    end
  end
end
