class Delivery < ApplicationRecord

  # orders/newで使用
	def delivery_address
		self.postcode + self.address + self.name
	end
  belongs_to :customer

  validates :postcode, length: {is: 7}, numericality: { only_integer: true }
  validates :address, presence: true
	validates :name, presence: true

end
