require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_path
    assert_response :success
  end

  test "should get new" do
    get new_item_path
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_path, params: { item: { date: @item.date, topic: "new topic", subtopic: "new subtopic", content: "some content" } }
    end

    assert_redirected_to items_path
  end

  test "should show item" do
    get item_path(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_path(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_path(@item), params: { item: { date: @item.date, topic: "another topic", subtopic: "another subtopic", content: "different content" } }
    assert_redirected_to items_path
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_path(@item)
    end

    assert_redirected_to items_path
  end
end
