class OrdersController < ApplicationController
  def create
    @Orders = Order.new(Order_params)

    if @Orders.save
      redirect_to @Orders
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @Orders = Order.find(params[:id])
    render json: { status: :ok, Orders: @Orders}
    
  end

  def new
    @Orders = Order.new
  end

  def index
    @Orders = Order.all
    
    render json: { status: :ok, Orders: @Orders }
  end
  
  def destroy
    @Orders = Order.find(params[:id])
    @Orders.destroy

    render json: { status: :ok, Orders: @Orders }
  end

  private
    def Order_params
      params.require(:product).permit(:name, :description, :price, :avatar)
    end
end
