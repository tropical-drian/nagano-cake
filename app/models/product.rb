class Product < ApplicationRecord
  belongs_to :genre
	has_many :orders, through: :ordered_products
	has_many :ordered_products
	has_many :cart_items
  attachment :image
end
