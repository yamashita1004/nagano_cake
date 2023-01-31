class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])

  end

  def edit
    @customer = Customer.find(params[:id])

  end
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end
  def quit
   @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to public_path
  end
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,:postal_code,:address, :telephone_number,:email)
  end

end
