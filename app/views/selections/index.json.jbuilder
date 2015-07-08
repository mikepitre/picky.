json.array!(@selections) do |selection|
  json.extract! selection, :id, :healthy, :spicy, :cheesy, :sandwiches, :tacos, :asian, :fusion, :bbq, :dessert, :burgers, :fried, :seafood, :meal_id
  json.url selection_url(selection, format: :json)
end
