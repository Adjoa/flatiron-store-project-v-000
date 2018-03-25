class LineItemsController < ApplicationController
    def create
        line_item = LineItem.create(:item_id => params[:item_id], :quantity => 1)
        current_user.create_current_cart unless current_user.current_cart
        if existing_item = current_user.current_cart.line_items.select { |line_item| line_item.item_id == params[:item_id ].to_i}.first
            existing_item.update(:quantity =>  existing_item.quantity += 1)
        else
            current_user.current_cart.line_items << line_item
        end
        current_user.save
        redirect_to cart_path(current_user.current_cart)
    end
end
