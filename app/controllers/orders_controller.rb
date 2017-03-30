class OrdersController < ApplicationController
	
	def new
	end	

	def create
		@carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)

		subtotal = 0
		@carted_products.each do |cp|
			subtotal += (cp.product.price*cp.quantity.to_i)
		end
     
		tax = subtotal.to_f*(0.09)
		total = subtotal.to_f + tax
		order = Order.new({user_id: current_user.id, subtotal: subtotal.to_f, tax: tax, total: total})

		if order.save 
			@carted_products.update(status:"purchased", order_id: order.id)
			@carted_products.each do |cp|
				new_stock = cp.product.stock.to_i - cp.quantity.to_i
				cp.product.update(stock: new_stock) 
			end
			flash[:success] = "Order Placed!"
			redirect_to "/orders/#{order.id}"

		else
			flash[:danger] = "Order not complete"
		end



	end

	def show
		@order = Order.find(params[:id])
		
	end

end
