class RemoveLocaitonFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :locaiton, :string
  end
end
