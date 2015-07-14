json.array!(@selections) do |selection|
  json.extract! selection, :id, :healthy, :spicy, :cheese, :sandwiches, :tacos, :asian, :fusion, :bbq, :dessert, :burgers, :fried, :seafood, :price, :distance, :take_out, :outdoor_seating, :serves_alcohol, :meal_id
  json.url selection_url(selection, format: :json)
end
