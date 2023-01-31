class Admin::OrderDetailsController < ApplicationController
  def update
    order_detailr.update(order_detail_params)
    redirect_to  admin_order_path(order.id)

  end
  private
  def customer_params
    params.require(:order_detail).permit(:making_status)
  end
end
