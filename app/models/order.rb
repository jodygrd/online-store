class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product, optional: true

	has_many :carted_products

end
