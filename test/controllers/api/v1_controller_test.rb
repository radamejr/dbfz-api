require 'test_helper'

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get characters" do
    get api_v1_characters_url
    assert_response :success
  end

end
