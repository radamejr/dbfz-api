require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get api/v1" do
    get characters_api/v1_url
    assert_response :success
  end

end
