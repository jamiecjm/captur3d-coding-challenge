require 'test_helper'

class CardboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cardboard = cardboards(:one)
  end

  test "should get index" do
    get cardboards_url
    assert_response :success
  end

  test "should get new" do
    get new_cardboard_url
    assert_response :success
  end

  test "should create cardboard" do
    assert_difference('Cardboard.count') do
      post cardboards_url, params: { cardboard: { cardboard_type: @cardboard.cardboard_type, price: @cardboard.price } }
    end

    assert_redirected_to cardboard_url(Cardboard.last)
  end

  test "should show cardboard" do
    get cardboard_url(@cardboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_cardboard_url(@cardboard)
    assert_response :success
  end

  test "should update cardboard" do
    patch cardboard_url(@cardboard), params: { cardboard: { cardboard_type: @cardboard.cardboard_type, price: @cardboard.price } }
    assert_redirected_to cardboard_url(@cardboard)
  end

  test "should destroy cardboard" do
    assert_difference('Cardboard.count', -1) do
      delete cardboard_url(@cardboard)
    end

    assert_redirected_to cardboards_url
  end
end
