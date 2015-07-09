class CreateFoursquares < ActiveRecord::Migration
  def change
    create_table :foursquares do |t|

      t.timestamps null: false
    end
  end
end
