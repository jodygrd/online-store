class User < ApplicationRecord
	has_secure_password
	has_many :orders
	has_many :carted_products


	def calculate_cart
		carted_products = CartedProduct.where(user_id: id, status: "carted")
		subtotal = 0
		carted_products.each do |cp|
			subtotal += (cp.product.price*cp.quantity.to_i)
		end
		tax = subtotal*0.09
		total = tax + subtotal
		cart_hash = {
			subtotal:subtotal,
			tax:tax,
			total:total
		}
	end

end
