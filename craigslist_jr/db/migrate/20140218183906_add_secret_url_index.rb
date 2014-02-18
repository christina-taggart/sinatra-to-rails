class AddSecretUrlIndex < ActiveRecord::Migration
  def change
    add_index :posts, :secret_url, unique: true
  end
end
