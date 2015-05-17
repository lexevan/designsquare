class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :company_name
      t.string :title
      t.string :locaiton
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
