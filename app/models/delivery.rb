class Delivery < ApplicationRecord

  belongs_to :customer

  validates :postcode, length: {is: 7}, numericality: { only_integer: true }
  validates :address, presence: true
	validates :name, presence: true

end
