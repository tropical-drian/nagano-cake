class Delivery < ApplicationRecord

  # orders/newで使用
	def delivery_address
		self.postal_code + self.address + self.name
	end

end
