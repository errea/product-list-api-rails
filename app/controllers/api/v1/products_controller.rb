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
    product = Product.new(
      name: prod_params[:name],
      brand: prod_params[:brand],
      price: prod_params[:price],
      description: prod_params[:description],
    )
    if product.save
        render json: product, status: 200
    else
        render json: {error: "Error creating product"}
    end
end

# This method looks up the product by its id, if it is found we render the json object
# otherwise we render an error object.
  def show
    product = Product.find_by(id: params[:id])
    if product
        render json: product, status: 200
    else
        render json: {error: "Product not found"}
    end
  end

private 
  def prod_params
    params.require(:product).permit([
      :name,
      :brand,
      :price,
      :description,
    ])
  end
end
