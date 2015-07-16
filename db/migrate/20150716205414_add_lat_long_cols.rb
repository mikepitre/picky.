class AddLatLongCols < ActiveRecord::Migration
  def change
    add_column :selections, :lat, :string
    add_column :selections, :long, :string
  end
end
