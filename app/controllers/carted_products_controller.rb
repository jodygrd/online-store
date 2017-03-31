class CartedProductsController < ApplicationController
	before_action :authenticate_user!

	def index

		@carted_products = CartedProduct.where(
				user_id: current_user.id, 
				status: "carted"
			)

		if @carted_products.empty?
			flash[:danger] = "Cauldron Empty"
			redirect_to "/"
		end

	end

	def create
		@carted_product = CartedProduct.new(
				user_id:current_user.id,
				product_id:params[:product_id], 
				quantity:params[:quantity], 
				status:"carted"
			)
		
		if @carted_product.save
			flash[:success] = "Product added to Cauldron."
			redirect_to "/products/#{params[:product_id]}"	
		else
			flash[:danger] = "Product could not be added to Cauldron."
			redirect_to "/products/#{params[:product_id]}"	
		end

	end

	def update
		@carted_product = CartedProduct.find(params[:product_id])
		@carted_product.update(status:"removed")
		flash[:success] = "product removed from cart"
		redirect_to "/cart"
	end

end
