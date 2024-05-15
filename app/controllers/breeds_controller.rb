class BreedsController < ApplicationController
  require 'net/http'

  def new
  end

  def fetch_image
    breed = params[:breed]
    url = "https://dog.ceo/api/breed/#{breed}/images/random"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    if result['status'] == 'success'
      image_url = result['message']
      Breed.create(name: breed, image_url: image_url)
      render json: { breed: breed, image: image_url }
    else
      render json: { breed: breed, image: 'Image not found' }
    end
  end
end
