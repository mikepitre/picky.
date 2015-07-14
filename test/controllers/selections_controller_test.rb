require 'test_helper'

class SelectionsControllerTest < ActionController::TestCase
  setup do
    @selection = selections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection" do
    assert_difference('Selection.count') do
      post :create, selection: { asian: @selection.asian, bbq: @selection.bbq, burgers: @selection.burgers, cheese: @selection.cheese, dessert: @selection.dessert, distance: @selection.distance, fried: @selection.fried, fusion: @selection.fusion, healthy: @selection.healthy, meal_id: @selection.meal_id, outdoor_seating: @selection.outdoor_seating, price: @selection.price, sandwiches: @selection.sandwiches, seafood: @selection.seafood, serves_alcohol: @selection.serves_alcohol, spicy: @selection.spicy, tacos: @selection.tacos, take_out: @selection.take_out }
    end

    assert_redirected_to selection_path(assigns(:selection))
  end

  test "should show selection" do
    get :show, id: @selection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection
    assert_response :success
  end

  test "should update selection" do
    patch :update, id: @selection, selection: { asian: @selection.asian, bbq: @selection.bbq, burgers: @selection.burgers, cheese: @selection.cheese, dessert: @selection.dessert, distance: @selection.distance, fried: @selection.fried, fusion: @selection.fusion, healthy: @selection.healthy, meal_id: @selection.meal_id, outdoor_seating: @selection.outdoor_seating, price: @selection.price, sandwiches: @selection.sandwiches, seafood: @selection.seafood, serves_alcohol: @selection.serves_alcohol, spicy: @selection.spicy, tacos: @selection.tacos, take_out: @selection.take_out }
    assert_redirected_to selection_path(assigns(:selection))
  end

  test "should destroy selection" do
    assert_difference('Selection.count', -1) do
      delete :destroy, id: @selection
    end

    assert_redirected_to selections_path
  end
end
