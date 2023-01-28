class Public::AddressesController < ApplicationController
  before_action :current_customer, only: [:edit, :update]
  def index
    @address = Address.new
    @addresses = Address.all
    
  end
  def create
    address = Address.new(address_params)
    address.save
    redirect_to public_addresses_path
  end
  def edit
    @address = Address.find(params[:id])
  end
  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to public_addresses_path
  end
   def destroy
    address= Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
   end



  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address )
  end
end
