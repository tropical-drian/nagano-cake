class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def withdraw
  end

  def out
    @customer = current_customer
    @customer.update(is_valid: true)
    reset_session
    redirect_to root_path
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path(current_customer)
  end

  private

	def customer_params
	  params.permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :residence, :phone_numbar)
	end

end
