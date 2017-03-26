class ProductsController < ApplicationController
	before_action :authenticate_user!

	
	def index
		category_id = params[:category_id]
		if  category_id
			category = Category.find(category_id)
			@products = category.products
		else
			@products = Product.all
		end

	end

	def show
		@product = Product.find(params[:id])
	end

	def new
	end

	def create
		@product = Product.create({title:params[:title], price:params[:price], description:params[:description]})
		flash[:success] = "Product Created!"
		redirect_to "/products/new"
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.update({id:params[:id], title:params[:title], price:params[:price], description:params[:description]})
		redirect_to "/products/#{@product.id}"
	end

	def destroy
		
	end

end
