require "test_helper"

class BreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get root_url
    assert_response :success
  end

  test "should get dog image" do
    get fetch_image_url, params: { breed: 'labrador' }
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal 'labrador', json_response['breed']
    assert json_response['image'].present?
  end

  test "should handle invalid breed" do
    get fetch_image_url, params: { breed: 'invalidbreed' }
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal 'invalidbreed', json_response['breed']
    assert_equal 'Image not found', json_response['image']
  end
end
