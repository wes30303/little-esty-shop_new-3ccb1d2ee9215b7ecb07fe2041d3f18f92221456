class DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    Discount.create(precent: params[:precent],
                     amount: params[:amount],
                     merchant_id: params[:merchant_id])
                     flash.notice = 'Discount Has Been Created!'
    redirect_to "/merchants/#{params[:merchant_id]}/discounts"
  end

  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy
    redirect_to "/merchants/#{params[:merchant_id]}/discounts"
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount.update(discount_params)
      flash.notice = "Succesfully Updated discount Info!"
    redirect_to "/merchants/#{params[:merchant_id]}/discounts"
  end

  def discount_params
    params.require(:discounts).permit(:precent, :amount, :merchant_id)
  end

end
