class DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.discounts.new(precent: params[:precent],
       amount: params[:amount])
    if discount.save
              flash.notice = 'Discount Has Been Created!'
               redirect_to "/merchants/#{params[:merchant_id]}/discounts"
      else
        flash.notice = 'Discount Has Not Been Created!'
        redirect_to "/merchants/#{params[:merchant_id]}/discounts/new"
      end
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
    @discount = Discount.find(params[:id])
      if @discount.update(discount_params)
        redirect_to "/merchants/#{params[:merchant_id]}/discounts"
        flash.notice = "Succesfully Updated discount Info!"
      else
        redirect_to "/merchants/#{params[:merchant_id]}/discounts/#{@discount.id}/edit"
        flash.notice = "Please Enter Valid Information!"
      end
  end

  def discount_params
    params.permit(:precent, :amount, :merchant_id)
  end

end
