class CartItem < ApplicationRecord

  belongs_to :product
	belongs_to :customer

<<<<<<< HEAD
=======
	validates :customer_id, :product_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8
end
