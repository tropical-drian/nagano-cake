class ApplicationController < ActionController::Base
<<<<<<< HEAD
=======

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  # 新規登録の時の保存機能
  # 会員情報編集時の保存機能
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :residence, :phone_number, :password]
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    end

<<<<<<< HEAD
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 税込の計算
  # floorは小数点切り捨て
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def subtotal(sub)
    (tax_price(sub.product.price) * sub.quantity)
  end

   # 商品合計金額の計算
  def product_total_price(products)
    sum = 0
    products.each do |product|
     sum += subtotal(product)
    end
    return price
  end

  # 請求額の計算
  def billing(order)
    product_total_price(current_cart) + order.postage
=======


  def
    after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
          root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
