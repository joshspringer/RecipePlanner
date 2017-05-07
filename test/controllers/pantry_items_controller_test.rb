require 'test_helper'

class PantryItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pantry_items_index_url
    assert_response :success
  end

end
