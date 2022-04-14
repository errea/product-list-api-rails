class Api::V1::ProductsController < ApplicationController

# indes renders all tems in the products table
  def index
    products = Product.all
    render json: products, status: 200
  end

# As the name implies this action lets us create a new product.
# If the product saves successfully, we render the json data for the product
# if the productdoes not save successfully, we render an error object
def create
    products = Product.new (
      name: prod_prams[:name],
      brand: prod_prams[:brand],
      price: prod_prams[:price],
      description: prod_prams[:description],
    )
end

  def show
  end
end
