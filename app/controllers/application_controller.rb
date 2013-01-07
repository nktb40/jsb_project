class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?
  
  protected
  
  def authorize
  	unless admin?
    flash[:error] = "unauthorized access"
    redirect_to admin_products_path
    false
  	end
  end
	
  def admin?
  	true
  end
end
