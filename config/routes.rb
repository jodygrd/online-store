Rails.application.routes.draw do

	root to: "products#index"

	get "/products" => "products#index"
	
	get "/products/new" => "products#new"
	post "/products" => "products#create"
	
	get "/products/:id" => "products#show"

	get "/products/:id/edit" => "products#edit"
	patch "/products" => "products#update"
	
	delete "/products/:id" => "products#destroy"


	#authentication
	get "/signup" => "users#new"
	post "/users" => "users#create"

	get "/login" => "sessions#new"
	post "/login" => "sessions#create"
	
	get "/logout" => "sessions#destroy"

  #checkout
  post "/orders" => "orders#create" 
  get "/orders/:id" => "orders#show"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
