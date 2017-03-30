class Product < ApplicationRecord
	has_many :images
	belongs_to :supplier

	has_many :categorized_products
	has_many :categories, through: :categorized_products

	def in_stock
		if stock > 10
			"In Stock."
		elsif stock > 0
			"Only #{stock} in stock. Order now!"
		else
			"Out of stock."
		end
	end
				

	
end
