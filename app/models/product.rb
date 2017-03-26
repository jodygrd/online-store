class Product < ApplicationRecord
	has_many :images
	has_many :orders
	belongs_to :supplier

	has_many :categorized_products
	has_many :categories, through: :categorized_products

	
end
