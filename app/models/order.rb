class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_products, dependent: :destroy

  enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
	enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

	 #製作ステータスの変更
  def change_production_status
    if self.status == "入金待ち"
      self.ordered_products.update_all(production_status: :着手不可)
    elsif self.status == "入金確認"
      self.ordered_products.update_all(production_status: :製作待ち)
    end
  end

end
