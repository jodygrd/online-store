class OrdersController < ApplicationController
	
	def new
	end	

	def create
		product = Product.find(params[:product_id])
		product.stock = product.stock - params[:quantity].to_i
		product.save

		subtotal = (product.price)*params[:quantity].to_i
		tax = subtotal*(0.09)
		total = subtotal + tax
		order = Order.create({user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id], subtotal: subtotal, tax: tax, total: total})
		
		redirect_to "/orders/#{order.id}"
	end

	def show
		@order = Order.find(params[:id])
		

	end

end
