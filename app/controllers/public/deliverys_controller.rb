class Public::DeliverysController < ApplicationController

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if  @delivery.save
      flash[:notice] = "配達先を登録しました"
      redirect_to  delivery_path
    else
      flash[:notice] = "必要情報を入力してください／ハイフンは使用できません"
      redirect_to  delivery_path
    end
  end

  def index
    @delivery = Delivery.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
