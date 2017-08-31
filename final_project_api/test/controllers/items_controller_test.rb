require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url, as: :json
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { brand: @item.brand, full_description: @item.full_description, price: @item.price, short_description: @item.short_description, sub_type: @item.sub_type, super_type: @item.super_type, title: @item.title, user_id: @item.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show item" do
    get item_url(@item), as: :json
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { brand: @item.brand, full_description: @item.full_description, price: @item.price, short_description: @item.short_description, sub_type: @item.sub_type, super_type: @item.super_type, title: @item.title, user_id: @item.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item), as: :json
    end

    assert_response 204
  end
end
