class Public::DeliveriesController < ApplicationController

  def create
      @delivery = Delivery.new(delivery_params)
      @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:notice] = "配達先を登録しました"
      redirect_to deliveries_path
    else
      @delivery = Delivery.new
      @delivery.customer_id = current_customer.id
      flash[:notice] = "必要情報を入力してください／ハイフンは使用できません"
      redirect_to deliveries_path
    end
  end

  def index
      @delivery = Delivery.new
      @delivery_info = Delivery.where(customer_id: current_customer.id)
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
     @delivery = Delivery.find(params[:id])
      if @delivery.update(delivery_params)
        flash[:notice] = "配達先を編集しました"
        redirect_to deliveries_path
      else
        @delivery = Delivery.find(params[:id])
        flash[:notice] = "必要情報を入力してください／ハイフンは使用できません"
        redirect_to deliveries_path
      end
  end

  def destroy
     @delivery = Delivery.find(params[:id])
     @delivery.destroy
     flash[:notice] = "配達先を編集しました"
     redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:name, :postcode, :address)
  end

end
