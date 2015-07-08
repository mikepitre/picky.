class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.boolean :healthy
      t.boolean :spicy
      t.boolean :cheesy
      t.boolean :sandwiches
      t.boolean :tacos
      t.boolean :asian
      t.boolean :fusion
      t.boolean :bbq
      t.boolean :dessert
      t.boolean :burgers
      t.boolean :fried
      t.boolean :seafood
      t.string :price
      t.string :distance
      t.boolean :take_out
      t.boolean :outdoor_seating
      t.boolean :serves_alcohol
      t.belongs_to :meal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
