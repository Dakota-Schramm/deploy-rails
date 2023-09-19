require 'httparty'
require 'json'

class ProductsController < ApplicationController

  # GET /products or /products.json
  def index
    response = HTTParty.get('https://fakerapi.it/api/v1/products?_quantity=5')
    render :not_found if response.code != 200
    c = JSON.parse(response.body)
    pp c["data"]
    @products = c["data"]
  end
end
