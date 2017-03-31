class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product, optional: true

	has_many :carted_products

	validates :subtotal, presence: true
	validates :subtotal, numericality: {greater_than_or_equal_to: 0}
	validates :tax, presence: true
	validates :tax, numericality: {greater_than_or_equal_to: 0}
	validates :total, presence: true
	validates :total, numericality: {greater_than_or_equal_to: 0}

end
