class AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      flash[:notice] = "新しい配送先を登録しました。"
      redirect_to request.referer
    else
      flash[:notice] = "全ての項目を正しく入力してください。"
      redirect_to request.referer
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を更新しました。"
      redirect_to customers_customer_addresses_path(current_customer.id)
    else
      flash[:notice] = "全ての項目を正しく入力してください。"
      redirect_to request.referer
    end
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
end
