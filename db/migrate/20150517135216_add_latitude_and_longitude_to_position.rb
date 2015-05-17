class AddLatitudeAndLongitudeToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :latitude, :float
    add_column :positions, :longitude, :float
  end
end
