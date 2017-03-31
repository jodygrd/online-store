class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    if !(current_user)
      flash[:danger] = "No muggles allowed! You must be logged in to do that!"
    	redirect_to '/login'
    end
  end

  def authenticate_admin!
    if !(current_user && current_user.admin)
      flash[:danger] = "Nice try, muggle."
      redirect_to '/'
    end 
  end

  def categories
  	@categories = Category.all
  end
  helper_method :categories

 
  def cart_items_total
    if current_user
      @carted_products = CartedProduct.where(
          user_id: current_user.id, 
          status: "carted"
        )
      total = 0
      @carted_products.each do |cp|
        total += 1*cp.quantity
      end
      total
    end
  end
  helper_method :cart_items_total

end
