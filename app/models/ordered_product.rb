class OrderedProduct < ApplicationRecord

  belongs_to :order
	belongs_to :product

	enum production_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

	#注文ステータスの変更
  def change_status
    products = self.order.ordered_products
    if self.production_status == "製作中"
      self.order.update(status: "製作中")
    elsif products.pluck(:production_status).all?{ |status| status == "製作完了"}
      self.order.update(status: "発送準備中")
    end
  end

end
