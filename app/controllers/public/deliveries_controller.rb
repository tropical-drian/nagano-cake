class Public::DeliveriesController < ApplicationController

  def create
      @delivery = Delivery.new(delivery_params)
      @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to deliveries_path, success: "配達先を登録しました"
    else
      @delivery = Delivery.new
      @delivery.customer_id = current_customer.id
      redirect_to deliveries_path, danger: "必要情報を入力してください／ハイフンは使用できません"
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
        redirect_to  deliveries_path,success: "配達先を編集しました"
      else
         @delivery = Delivery
        redirect_to  deliveries_path,danger: "必要情報を入力してください／ハイフンは使用できません"
      end
  end

  def destroy
     @delivery = Delivery.find(params[:id])
     @delivery.destroy
     redirect_to deliveries_path,success: "配達先を削除しました"
  end

  private

  def delivery_params
    params.require(:delivery).permit(:name, :postcode, :address)
  end

end
