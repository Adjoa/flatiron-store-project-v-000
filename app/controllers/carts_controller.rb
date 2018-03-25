class CartsController < ApplicationController
    def show
        @cart = Cart.find(params[:id])
    end

    def checkout
        current_user.current_cart.line_items.each do |l|
            item = Item.find(l[:item_id])
            item.inventory = item.inventory - l.quantity
            item.save
        end
        current_user.current_cart_id = nil
        current_user.save
        cart = Cart.find(params[:id])
        cart.update(:status => "submitted")


        redirect_to cart_path(cart)
    end
end
