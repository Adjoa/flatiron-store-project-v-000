class LineItemsController < ApplicationController

	def create
		@line_item = LineItem.new(:item_id => params[:item_id], :quantity => 1)
		@cart = Cart.create(:user_id => current_user.id)
		# binding.pry
		@cart.line_items << @line_item
		current_user.current_cart = @cart
		# current_cart.line_item = @line_item

		redirect_to cart_path(@cart)
	end

	# private

	# def line_item_params
	# 	require()
	# end

end
