require 'test_helper'

class ElectricalControllerTest < ActionDispatch::IntegrationTest
  test "should get data" do
    get electrical_data_url
    assert_response :success
  end

end
