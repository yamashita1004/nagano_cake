class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  def update

    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to  admin_order_path(order.id)

  end
  private
  def customer_params
    params.require(:order).permit(:status)
  end
end
