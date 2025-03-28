require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_path
    assert_selector "h4", text: "Items"
  end

  test "should create item" do
    visit items_path
    find("img[alt='New item']").click

    fill_in "Date", with: @item.date
    fill_in "Subtopic", with: @item.subtopic
    fill_in "Topic", with: @item.topic
    # The fill_in method in Capybara is specifically designed for form fields like <input> and <textarea>. Capybara won't recognize trix-editor element as a fillable field
    find("#item_content").set("some content")
    # fill_in "item_content", with: 'some content'
    click_on "Create Item"

    assert_text "Item was successfully created"
  end

  test "should update Item" do
    visit items_path
    # find("img[alt='Edit item']").click
    # click_on "Edit this item", match: :first
    # this works because alt attribute of image is set to 'Edit item'
    click_on "Edit item", match: :first

    fill_in "Date", with: @item.date
    fill_in "Subtopic", with: @item.subtopic
    fill_in "Topic", with: @item.topic
    click_on "Update Item"

    assert_text "Item was successfully updated"
  end

  test "should destroy Item" do
    visit items_path
    # find("img[alt='Bin item']").click
    # click_on "Destroy this item", match: :first
    accept_confirm("The item will be deleted. Are you sure?") do
      click_on "Bin item", match: :first
    end

    assert_text "Item was successfully binned"
  end
end
