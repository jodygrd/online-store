class Product < ApplicationRecord
	has_many :images
	belongs_to :supplier

	has_many :categorized_products
	has_many :categories, through: :categorized_products

	validates :title, presence: true
	validates :price, presence: true, numericality: true
	validates :stock, numericality: {greater_than_or_equal_to: 0}
	validates :description, length: {minimum: 5, maximum: 500}, allow_blank: true

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
