class AddLocationToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :location, :string
  end
end
