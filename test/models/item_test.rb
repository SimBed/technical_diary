require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(date: "2025-03-28",
                        topic: "Web",
                        subtopic: "seo",
                        content: "i added a sitemap")
  end

  test "should be valid" do
    assert_predicate @item, :valid?
  end
end
