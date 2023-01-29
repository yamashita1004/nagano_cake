class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
 
  def index
  end

  def show
  end
  def confirm
    @cart_items = current_customer.cart_items
    @shopping_cost = 800
    @total = 0
  
    
  if params[:order][:address_num] == "0"
  @order = Order.new(order_params)
  @order.postal_code = current_customer.postal_code
  @order.address = current_customer.address
  @order.name = current_customer.last_name + current_customer.first_name
  
  elsif params[:order][:address_num] == "1"
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  
  elsif params[:order][:address_num] == "2"
    @order = Order.new(order_params)
  end
  end
  def create
      order = Order.new(order_params)
      order.save
      redirect_to public_orders_thanks_path
  end


private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end
end
