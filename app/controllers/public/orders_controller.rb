class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.order.all

  end

  def show
    @order = current_customer.order.find(params[:id])
    @order_details = @order.order_details
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
    if current_customer.cart_items
    else
      redirect_to public_items_path
    end

      order = Order.new(order_params)
      if order.save
      current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.with_tax_price
      order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_orders_thanks_path
      else
       render '/public/orders/new'
      end

  end


private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name,:shopping_cost, :total_payment, :customer_id)
end
end
