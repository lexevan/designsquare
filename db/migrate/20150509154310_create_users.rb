class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :company
      t.string :website
      t.string :location
      
      t.string :excited_about
      t.date :experience
      t.text :bio
      t.string :expertise

      t.string :linkedin
      t.string :twitter
      t.string :instagram

      t.boolean :astronaut
      t.boolean :editor

      t.integer :role, default: 0

      t.timestamps null: false
    end

      add_index :users, :username, unique: true

  end
end
