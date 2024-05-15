require 'test_helper'

class BreedFlowTest < ActionDispatch::IntegrationTest
  test "can see the form and submit breed" do
    get root_url
    assert_response :success
    assert_select 'form'

    get fetch_image_url, params: { breed: 'labrador' }, xhr: true
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal 'labrador', json_response['breed']
    assert json_response['image'].present?
  end
end
