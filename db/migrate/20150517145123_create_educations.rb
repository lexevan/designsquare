class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.integer :start_year
      t.integer :end_year
      t.string :degree
      t.string :field_of_study
      t.text :description
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
