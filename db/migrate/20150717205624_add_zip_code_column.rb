class AddZipCodeColumn < ActiveRecord::Migration
  def change
    add_column :selections, :zip_code, :string
  end
end
