class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_item = CartItem.new
    @cart_items = CartItem.all
    @total = 0
  end
  def create
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.present?
       cart_item.amount += params[:cart_item][:amount].to_i
       cart_item.save
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
      redirect_to public_cart_items_path
  end
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
   end
   def destroy_all
    CartItem.destroy_all
    current_customer.id.cart_item.destroy_all
    redirect_to public_cart_items_path, notice: 'カートが空になりました。'
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
