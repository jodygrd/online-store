class ProductsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]

	
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
		@product = Product.new
	end

	def create
		@product = Product.new({title:params[:title], price:params[:price], description:params[:description], supplier_id: params[:supplier_id], stock: params[:stock]})
		
		if @product.save
			flash[:success] = "Product Created!"
			redirect_to "/products/new"
		else
			flash[:danger] = "Could not create product!"
			render "new.html.erb"
		end

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
