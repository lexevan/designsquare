class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post
      t.integer :user_id
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
