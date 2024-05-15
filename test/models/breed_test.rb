require "test_helper"

class BreedTest < ActiveSupport::TestCase
  test "should not save breed without name" do
    breed = Breed.new(image_url: "https://example.com/dog.jpg")
    assert_not breed.save, "Saved the breed without a name"
  end

  test "should not save breed without image_url" do
    breed = Breed.new(name: "Labrador")
    assert_not breed.save, "Saved the breed without an image URL"
  end

  test "should not save breed with invalid image_url" do
    breed = Breed.new(name: "Labrador", image_url: "invalid_url")
    assert_not breed.save, "Saved the breed with an invalid image URL"
  end

  test "should save breed with valid name and image_url" do
    breed = Breed.new(name: "Labrador", image_url: "https://example.com/dog.jpg")
    assert breed.save, "Couldn't save the breed with valid name and image URL"
  end
end
