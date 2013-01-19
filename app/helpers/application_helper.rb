module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
   def sum_up_order(order)
    @order = order
  	 @user = User.find(@order.user_id)
  	 @items = @user.orders.find(@order.id).cart_items.where(:item_type=>"order")
  	 @sum = 0
  	 @items.each do |item|
  	 	@sum += (Product.find(item.product_id).price * item.quantity)
  	 end	
  	 @sum
  end
 end
  
