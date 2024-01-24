class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render json: { status: :ok, products: @product}
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
    
    render json: { status: :ok, products: @products }
  end
  

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
